-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.fp_wire.all;

entity fp_exe is
	port(
		reset        : in  std_logic;
		clock        : in  std_logic;
		fp_exe_i     : in  fp_exe_in_type;
		fp_exe_o     : out fp_exe_out_type;
		fp_ext1_o    : in  fp_ext_out_type;
		fp_ext1_i    : out fp_ext_in_type;
		fp_ext2_o    : in  fp_ext_out_type;
		fp_ext2_i    : out fp_ext_in_type;
		fp_ext3_o    : in  fp_ext_out_type;
		fp_ext3_i    : out fp_ext_in_type;
		fp_cmp_o     : in  fp_cmp_out_type;
		fp_cmp_i     : out fp_cmp_in_type;
		fp_cvt_f2f_o : in  fp_cvt_f2f_out_type;
		fp_cvt_f2f_i : out fp_cvt_f2f_in_type;
		fp_cvt_f2i_o : in  fp_cvt_f2i_out_type;
		fp_cvt_f2i_i : out fp_cvt_f2i_in_type;
		fp_cvt_i2f_o : in  fp_cvt_i2f_out_type;
		fp_cvt_i2f_i : out fp_cvt_i2f_in_type;
		fp_max_o     : in  fp_max_out_type;
		fp_max_i     : out fp_max_in_type;
		fp_sgnj_o    : in  fp_sgnj_out_type;
		fp_sgnj_i    : out fp_sgnj_in_type;
		fp_fma_o     : in  fp_fma_out_type;
		fp_fma_i     : out fp_fma_in_type;
		fp_fdiv_o    : in  fp_fdiv_out_type;
		fp_fdiv_i    : out fp_fdiv_in_type;
		fp_rnd_o     : in  fp_rnd_out_type;
		fp_rnd_i     : out fp_rnd_in_type
	);
end fp_exe;

architecture behavior of fp_exe is

begin

	process(fp_exe_i, fp_ext1_o, fp_ext2_o, fp_ext3_o, fp_cmp_o, fp_max_o, fp_sgnj_o, fp_cvt_f2f_o, fp_cvt_f2i_o, fp_cvt_i2f_o, fp_fma_o, fp_fdiv_o, fp_rnd_o)
		variable data1 : std_logic_vector(63 downto 0);
		variable data2 : std_logic_vector(63 downto 0);
		variable data3 : std_logic_vector(63 downto 0);
		variable op    : fp_operation_type;
		variable fmt   : std_logic_vector(1 downto 0);
		variable rm    : std_logic_vector(2 downto 0);

		variable result : std_logic_vector(63 downto 0);
		variable flags  : std_logic_vector(4 downto 0);
		variable ready  : std_logic;

		variable fp_rnd : fp_rnd_in_type;

		variable fmt_ext : std_logic_vector(1 downto 0);

		variable ext1 : std_logic_vector(64 downto 0);
		variable ext2 : std_logic_vector(64 downto 0);
		variable ext3 : std_logic_vector(64 downto 0);

		variable class1 : std_logic_vector(9 downto 0);
		variable class2 : std_logic_vector(9 downto 0);
		variable class3 : std_logic_vector(9 downto 0);

	begin

		if fp_exe_i.enable = '1' then
			data1 := fp_exe_i.data1;
			data2 := fp_exe_i.data2;
			data3 := fp_exe_i.data3;
			op := fp_exe_i.op;
			fmt := fp_exe_i.fmt;
			rm := fp_exe_i.rm;
		else
			data1 := (others => '0');
			data2 := (others => '0');
			data3 := (others => '0');
			op := init_fp_operation;
			fmt := (others => '0');
			rm := (others => '0');
		end if;

		result := (others => '0');
		flags := (others => '0');
		ready := fp_exe_i.enable;

		fp_rnd := init_fp_rnd_in;

		if op.fcvt_f2f = '1' then
			fmt_ext := fp_exe_i.op.fcvt_op;
		else
			fmt_ext := fp_exe_i.fmt;
		end if;

		fp_ext1_i.data <= data1;
		fp_ext1_i.fmt <= fmt_ext;
		fp_ext2_i.data <= data2;
		fp_ext2_i.fmt <= fmt_ext;
		fp_ext3_i.data <= data3;
		fp_ext3_i.fmt <= fmt_ext;

		ext1 := fp_ext1_o.result;
		ext2 := fp_ext2_o.result;
		ext3 := fp_ext3_o.result;

		class1 := fp_ext1_o.class;
		class2 := fp_ext2_o.class;
		class3 := fp_ext3_o.class;

		fp_cmp_i.data1 <= ext1;
		fp_cmp_i.data2 <= ext2;
		fp_cmp_i.rm <= rm;
		fp_cmp_i.class1 <= class1;
		fp_cmp_i.class2 <= class2;

		fp_max_i.data1 <= data1;
		fp_max_i.data2 <= data2;
		fp_max_i.ext1 <= ext1;
		fp_max_i.ext2 <= ext2;
		fp_max_i.fmt <= fmt;
		fp_max_i.rm <= rm;
		fp_max_i.class1 <= class1;
		fp_max_i.class2 <= class2;

		fp_sgnj_i.data1 <= data1;
		fp_sgnj_i.data2 <= data2;
		fp_sgnj_i.fmt <= fmt;
		fp_sgnj_i.rm <= rm;

		fp_cvt_i2f_i.data <= data1;
		fp_cvt_i2f_i.op <= op;
		fp_cvt_i2f_i.fmt <= fmt;
		fp_cvt_i2f_i.rm <= rm;

		fp_cvt_f2f_i.data <= ext1;
		fp_cvt_f2f_i.fmt <= fmt;
		fp_cvt_f2f_i.rm <= rm;
		fp_cvt_f2f_i.class <= class1;

		fp_cvt_f2i_i.data <= ext1;
		fp_cvt_f2i_i.op <= op;
		fp_cvt_f2i_i.rm <= rm;
		fp_cvt_f2i_i.class <= class1;

		fp_fma_i.data1 <= ext1;
		fp_fma_i.data2 <= ext2;
		fp_fma_i.data3 <= ext3;
		fp_fma_i.class1 <= class1;
		fp_fma_i.class2 <= class2;
		fp_fma_i.class3 <= class3;
		fp_fma_i.op <= op;
		fp_fma_i.fmt <= fmt;
		fp_fma_i.rm <= rm;

		fp_fdiv_i.data1 <= ext1;
		fp_fdiv_i.data2 <= ext2;
		fp_fdiv_i.class1 <= class1;
		fp_fdiv_i.class2 <= class2;
		fp_fdiv_i.op <= op;
		fp_fdiv_i.fmt <= fmt;
		fp_fdiv_i.rm <= rm;

		if fp_fma_o.ready = '1' then
			fp_rnd := fp_fma_o.fp_rnd;
		elsif fp_fdiv_o.ready = '1' then
			fp_rnd := fp_fdiv_o.fp_rnd;
		elsif op.fcvt_f2f = '1' then
			fp_rnd := fp_cvt_f2f_o.fp_rnd;
		elsif op.fcvt_i2f = '1' then
			fp_rnd := fp_cvt_i2f_o.fp_rnd;
		end if;

		fp_rnd_i <= fp_rnd;

		if fp_fma_o.ready = '1' then
			result := fp_rnd_o.result;
			flags := fp_rnd_o.flags;
			ready := '1';
		elsif fp_fdiv_o.ready = '1' then
			result := fp_rnd_o.result;
			flags := fp_rnd_o.flags;
			ready := '1';
		elsif op.fmadd = '1' then
			ready := '0';
		elsif op.fmsub = '1' then
			ready := '0';
		elsif op.fnmsub = '1' then
			ready := '0';
		elsif op.fnmadd = '1' then
			ready := '0';
		elsif op.fadd = '1' then
			ready := '0';
		elsif op.fsub = '1' then
			ready := '0';
		elsif op.fmul = '1' then
			ready := '0';
		elsif op.fdiv = '1' then
			ready := '0';
		elsif op.fsqrt = '1' then
			ready := '0';
		elsif op.fsgnj = '1' then
			result := fp_sgnj_o.result;
			flags := "00000";
		elsif op.fmax = '1' then
			result := fp_max_o.result;
			flags := fp_max_o.flags;
		elsif op.fcmp = '1' then
			result := fp_cmp_o.result;
			flags := fp_cmp_o.flags;
		elsif op.fclass = '1' then
			result := "00" & X"0000000000000" & class1;
			flags := "00000";
		elsif op.fmv_f2i = '1' then
			result := data1;
			flags := "00000";
		elsif op.fmv_i2f = '1' then
			result := data1;
			flags := "00000";
		elsif op.fcvt_f2f = '1' then
			result := fp_rnd_o.result;
			flags := fp_rnd_o.flags;
		elsif op.fcvt_i2f = '1' then
			result := fp_rnd_o.result;
			flags := fp_rnd_o.flags;
		elsif op.fcvt_f2i = '1' then
			result := fp_cvt_f2i_o.result;
			flags := fp_cvt_f2i_o.flags;
		end if;

		fp_exe_o.result <= result;
		fp_exe_o.flags <= flags;
		fp_exe_o.ready <= ready;

	end process;

end behavior;
