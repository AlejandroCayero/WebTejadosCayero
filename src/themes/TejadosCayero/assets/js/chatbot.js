/**
 * Configuración del flujo del chatbot (Árbol de decisión)
 */
const chatFlow = {
    inicio: {
        text: "¡Hola! ¿En qué te podemos ayudar con tu tejado?",
        options: [
            { label: "Necesito una reparación", next: "reparacion_tipo" },
            { label: "Tejado nuevo", next: "tejado_nuevo" }
        ]
    },
    tejado_nuevo: {
        text: "Para presupuestos de tejados nuevos, lo mejor es que <a href='/contacto'>rellenes nuestro formulario detallado</a>. ¡Te esperamos!",
        options: [{ label: "Volver al inicio", next: "inicio" }]
    },
    reparacion_tipo: {
        text: "¿Qué tipo de reparación necesitas?",
        saveKey: "tipo",
        options: [
            { label: "Estructura", next: "reparacion_urgencia" },
            { label: "Aislante", next: "reparacion_urgencia" },
            { label: "Teja", next: "reparacion_urgencia" }
        ]
    },
    reparacion_urgencia: {
        text: "¿Es una reparación urgente?",
        saveKey: "urgencia",
        options: [
            { label: "Sí, es urgente", next: "reparacion_email" },
            { label: "No es urgente", next: "reparacion_email" }
        ]
    },
    reparacion_email: {
        text: "Entendido. Déjanos tu email y nos pondremos en contacto contigo lo antes posible:",
        type: "input", 
        placeholder: "ejemplo@correo.com",
        buttonText: "Enviar solicitud",
        next: "final_agradecimiento"
    },
    final_agradecimiento: {
        text: "¡Gracias! Hemos recibido tu solicitud. Revisaremos los datos de tu reparación y te escribiremos pronto.",
        options: [{ label: "Cerrar chat", action: "close" }]
    }
};

/**
 * Selección de elementos del DOM y variables de estado
 */
const btnToggle = document.getElementById('chatbot-toggle-btn');
const chatWindow = document.getElementById('chatbot-window');
const messagesDiv = document.getElementById('chatbot-messages');
const optionsDiv = document.getElementById('chatbot-options');
const iconOpen = document.getElementById('icon-open');
const iconClose = document.getElementById('icon-close');
const welcomeBubble = document.getElementById('chatbot-welcome-bubble');

let chatOpen = false;
let isFirstLoad = true; 
let reparacionData = {}; // Almacena respuestas para el envío final

/**
 * Gestión de apertura/cierre y visibilidad inicial
 */
btnToggle.addEventListener('click', () => {
    if (welcomeBubble) welcomeBubble.style.display = 'none';

    chatOpen = !chatOpen;
    chatWindow.style.display = chatOpen ? 'flex' : 'none';
    iconOpen.style.display = chatOpen ? 'none' : 'block';
    iconClose.style.display = chatOpen ? 'block' : 'none';
    
    if(chatOpen && isFirstLoad) {
        messagesDiv.innerHTML = ''; 
        renderNode('inicio');
        isFirstLoad = false;
    }
});

setTimeout(() => {
    if (!chatOpen && welcomeBubble) {
        welcomeBubble.classList.add('visible');
    }
}, 3000);

/**
 * Función para inyectar mensajes en el contenedor
 */
function addMessage(text, sender) {
    const div = document.createElement('div');
    div.className = `chat-bubble ${sender}-message`;
    div.innerHTML = text; // innerHTML permite renderizar enlaces <a>
    messagesDiv.appendChild(div);
    messagesDiv.scrollTop = messagesDiv.scrollHeight;
}

/**
 * Motor de renderizado del árbol de decisión
 */
function renderNode(nodeId) {
    const node = chatFlow[nodeId];
    if (!node) return;

    optionsDiv.innerHTML = '';
    addMessage(node.text, 'bot');

    // Renderizado de campo de texto (Email)
    if (node.type === "input") {
        const input = document.createElement('input');
        input.type = "email";
        input.placeholder = node.placeholder;
        input.className = "form-control mb-2";

        const btn = document.createElement('button');
        btn.className = "btn btn-primary w-100";
        btn.textContent = node.buttonText;
        
        btn.onclick = () => {
            const email = input.value;
            if (email.includes('@') && email.includes('.')) {
                reparacionData.email = email;
                sendDataToOctober();
                renderNode(node.next);
            } else {
                alert("Por favor, introduce un email válido.");
            }
        };
        optionsDiv.appendChild(input);
        optionsDiv.appendChild(btn);

    // Renderizado de botones de opciones
    } else if (node.options) {
        node.options.forEach(opt => {
            const btn = document.createElement('button');
            btn.className = 'chatbot-option-btn';
            btn.textContent = opt.label;
            
            btn.onclick = () => {
                // Persistencia de datos según saveKey del nodo
                if (node.saveKey) reparacionData[node.saveKey] = opt.label;

                if (opt.action === "close") {
                    btnToggle.click();
                } else {
                    addMessage(opt.label, 'user');
                    optionsDiv.innerHTML = ''; 
                    setTimeout(() => renderNode(opt.next), 500);
                }
            };
            optionsDiv.appendChild(btn);
        });
    }
}

/**
 * Envío de datos al handler PHP de October CMS vía AJAX
 */
function sendDataToOctober() {
    // Usamos la API nativa de October CMS en lugar de 'fetch'.
    // Esto garantiza que el Token CSRF y el nombre del Handler lleguen al 100%.

    if (typeof $ !== 'undefined' && $.request) {
        // Para October CMS v1 y v2 (Basado en jQuery)
        $.request('onSendChatbot', {
            data: reparacionData,
            success: function(data) {
                console.log('El servidor respondió:', data);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Error de October:', textStatus);
            }
        });
    } 
    else if (typeof oc !== 'undefined' && oc.request) {
        // Para October CMS v3 (Vanilla JS)
        oc.request('onSendChatbot', {
            data: reparacionData,
            success: function(data) {
                console.log('El servidor respondió:', data);
            }
        });
    } 
    else {
        console.error('El framework AJAX de October no está cargado en el Layout.');
    }
}