// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_0.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_1.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_2.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_3.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_4.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_5.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_6.mem);
  $readmemh("./memory_init/match_table.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.front.filter_inst.match_table_7.mem);

  $readmemh("./memory_init/rule_2_pg_packed.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pg_inst.rule2pg_table_0_1.mem);
  $readmemh("./memory_init/rule_2_pg_packed.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pg_inst.rule2pg_table_2_3.mem);

  $readmemh("./memory_init/hashtable0_packed.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.back.hashtable_inst_0_0.mem);
  $readmemh("./memory_init/hashtable1_packed.mif",
            UUT.rpu_inst.accel_wrap_inst.fast_pattern_sme_inst.pigasus.back.hashtable_inst_1_0.mem);
