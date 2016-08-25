<?php

use yii\db\Migration;

class m160825_143941_okei_init extends Migration
{
    public function safeUp()
    {
        $schemaFile = implode(DIRECTORY_SEPARATOR, [
            __DIR__,
            'sql',
            'okei_schema.sql',
        ]);
        $dataFile = implode(DIRECTORY_SEPARATOR, [
            __DIR__,
            'sql',
            'okei_data.sql',
        ]);

        $this->execute(file_get_contents($schemaFile));
        $this->execute(file_get_contents($dataFile));
    }

    public function safeDown()
    {
        $this->dropTable('class_unit_type');
        $this->dropTable('class_unit_group');
        $this->dropTable('class_unit');
    }
}
