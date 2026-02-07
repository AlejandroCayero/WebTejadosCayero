<?php

use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

return new class extends Migration
{
    public function up()
    {
        Schema::create('dashboard_dashboards', function(Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->nullable();
            $table->string('code')->nullable();
            $table->string('icon')->nullable();
            $table->string('owner_type')->nullable();
            $table->string('owner_field')->nullable();
            $table->mediumText('definition')->nullable();
            $table->boolean('is_custom')->default(false);
            $table->boolean('is_global')->default(false);
            $table->integer('sort_order')->nullable();
            $table->bigInteger('updated_user_id')->unsigned()->nullable();
            $table->bigInteger('created_user_id')->unsigned()->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('dashboard_dashboards');
    }
};
