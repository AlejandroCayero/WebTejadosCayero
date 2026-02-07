<?php

use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

return new class extends Migration
{
    public function up()
    {
        Schema::dropIfExists('backend_dashboards');
        Schema::dropIfExists('backend_report_data_cache');
    }

    public function down()
    {
    }
};
