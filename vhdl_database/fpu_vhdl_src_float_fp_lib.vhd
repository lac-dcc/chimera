-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.lzc_wire.all;
use work.lzc_lib.all;
use work.fp_wire.all;

package fp_lib is

	component fp_ext
		port(
			fp_ext_i : in  fp_ext_in_type;
			fp_ext_o : out fp_ext_out_type;
			lzc_o    : in  lzc_64_out_type;
			lzc_i    : out lzc_64_in_type
		);
	end component;

	component fp_cmp
		port(
			fp_cmp_i : in  fp_cmp_in_type;
			fp_cmp_o : out fp_cmp_out_type
		);
	end component;

	component fp_cvt
		port(
			fp_cvt_f2f_i : in  fp_cvt_f2f_in_type;
			fp_cvt_f2f_o : out fp_cvt_f2f_out_type;
			fp_cvt_f2i_i : in  fp_cvt_f2i_in_type;
			fp_cvt_f2i_o : out fp_cvt_f2i_out_type;
			fp_cvt_i2f_i : in  fp_cvt_i2f_in_type;
			fp_cvt_i2f_o : out fp_cvt_i2f_out_type;
			lzc_i        : out lzc_64_in_type;
			lzc_o        : in  lzc_64_out_type
		);
	end component;

	component fp_max
		port(
			fp_max_i : in  fp_max_in_type;
			fp_max_o : out fp_max_out_type
		);
	end component;

	component fp_sgnj
		port(
			fp_sgnj_i : in  fp_sgnj_in_type;
			fp_sgnj_o : out fp_sgnj_out_type
		);
	end component;

	component fp_rnd
		port(
			fp_rnd_i : in  fp_rnd_in_type;
			fp_rnd_o : out fp_rnd_out_type
		);
	end component;

	component fp_fma
		port(
			reset    : in  std_logic;
			clock    : in  std_logic;
			fp_fma_i : in  fp_fma_in_type;
			fp_fma_o : out fp_fma_out_type;
			lzc_o    : in  lzc_256_out_type;
			lzc_i    : out lzc_256_in_type
		);
	end component;

	component fp_mac
		port(
			fp_mac_i : in  fp_mac_in_type;
			fp_mac_o : out fp_mac_out_type
		);
	end component;

	component fp_fdiv
		port(
			reset     : in  std_logic;
			clock     : in  std_logic;
			fp_fdiv_i : in  fp_fdiv_in_type;
			fp_fdiv_o : out fp_fdiv_out_type;
			fp_mac_i  : out fp_mac_in_type;
			fp_mac_o  : in  fp_mac_out_type
		);
	end component;

	component fp_exe
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
	end component;

end package;
