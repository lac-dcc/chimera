-------------------------------------------------------------------------------
-- File       : bmp_pkg.vhd
-- Author     : mr-kenhoff
-------------------------------------------------------------------------------
-- Description:
--      Low level access to bitmap files
--
-- Target: Simulator
-- Dependencies: none
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


package bmp_pkg is

	constant BMP_MAX_WIDTH  : integer := 960;
	constant BMP_MAX_HEIGHT : integer := 720;

	subtype bmp_slv8_t is std_logic_vector(7 downto 0);
	subtype bmp_slv16_t is std_logic_vector(15 downto 0);
	subtype bmp_slv32_t is std_logic_vector(31 downto 0);



	type bmp_meta is
		record
			width : integer;
			height : integer;
		end record;

	type bmp_pix is
		record
			r: bmp_slv8_t;
			g: bmp_slv8_t;
			b: bmp_slv8_t;
		end record;

	type bmp_line is array (0 to BMP_MAX_WIDTH-1) of bmp_pix;
	type bmp_data is array (0 to BMP_MAX_HEIGHT-1) of bmp_line;

	type bmp is
		record
			meta : bmp_meta;
			data: bmp_data;
		end record;

	type bmp_ptr is access bmp;



	----------------------------------------------------------------------------
	-- Public procedures and functions
	----------------------------------------------------------------------------

	procedure bmp_open ( ptr : inout bmp_ptr; filename : in string );
	procedure bmp_save ( ptr : inout bmp_ptr; filename : in string );

	procedure bmp_get_width ( ptr : inout bmp_ptr; width : out integer);
	procedure bmp_get_height ( ptr : inout bmp_ptr; height : out integer);

	procedure bmp_get_pix ( ptr : inout bmp_ptr; x: in natural; y : in natural; pix : out bmp_pix );
	procedure bmp_set_pix ( ptr : inout bmp_ptr; x: in natural; y : in natural; pix : in bmp_pix );


end package bmp_pkg;



package body bmp_pkg is


	----------------------------------------------------------------------------
	-- Types
	----------------------------------------------------------------------------

	type bmp_file is file of character;

	type bmp_header_array is array (0 to 53) of bmp_slv8_t;


	----------------------------------------------------------------------------
	-- Constants
	----------------------------------------------------------------------------

	constant BMP_STD_HEADER_ARRAY : bmp_header_array := (
		"01000010", "01001101", "00110110", "00000000", "00001100", "00000000",
		"00000000", "00000000", "00000000", "00000000", "00110110", "00000000",
		"00000000", "00000000", "00101000", "00000000", "00000000", "00000000",
		"00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
		"00000000", "00000000", "00000001", "00000000", "00011000", "00000000",
		"00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
		"00000000", "00000000", "11000100", "00001110", "00000000", "00000000",
		"11000100", "00001110", "00000000", "00000000", "00000000", "00000000",
		"00000000", "00000000", "00000000", "00000000", "00000000", "00000000"
		);


	----------------------------------------------------------------------------
	-- Procedures
	----------------------------------------------------------------------------

	procedure bmp_open ( ptr : inout bmp_ptr; filename : in string ) is

		file fp : bmp_file open read_mode is filename;
		variable header_array : bmp_header_array;
		variable byte : character;
		variable val : integer;

		variable tmp_slv32 : bmp_slv32_t;   -- Temporary variable

		variable file_pos : integer := 0;
		variable data_offset : integer;

	begin

		-- Read bitmap header into array
		for i in 0 to 53 loop
			read( fp, byte );
			val := character'pos( byte );

			header_array(i) := bmp_slv8_t(to_unsigned(val, bmp_slv8_t'length));
			file_pos := file_pos + 1;
		end loop;

		-- TODO: Validate bitmap

		-- Extract image width from array
		tmp_slv32 := header_array(21) &  header_array(20) & header_array(19) & header_array(18);
		ptr.meta.width := to_integer(signed(tmp_slv32));
		-- Extract image height from array
		tmp_slv32 := header_array(25) &  header_array(24) & header_array(23) & header_array(22);
		ptr.meta.height := to_integer(signed(tmp_slv32));
		-- Extract offset of image data from array
		tmp_slv32 := header_array(13) &  header_array(12) & header_array(11) & header_array(10);
		data_offset := to_integer(signed(tmp_slv32));   -- HACK: actually the data offset is not signed


		assert ptr.meta.width <= BMP_MAX_WIDTH  report "Image height too big. Increase BMP_MAX_WIDTH!" severity error;
		assert ptr.meta.height <= BMP_MAX_HEIGHT  report "Image width too big. Increase BMP_MAX_HEIGHT!" severity error;


		-- Fast forward to image data
		while file_pos < data_offset loop
			read( fp, byte );
			file_pos := file_pos + 1;
		end loop;


		-- Extract image data
		line : for y in ptr.meta.height-1 downto 0 loop
			pix : for x in 0 to ptr.meta.width -1 loop

				-- Blue pixel
				read( fp, byte );
				val := character'pos( byte );
				ptr.data(y)(x).b := bmp_slv8_t(to_unsigned(val, bmp_slv8_t'length));
				-- Green pixel
				read( fp, byte );
				val := character'pos( byte );
				ptr.data(y)(x).g := bmp_slv8_t(to_unsigned(val, bmp_slv8_t'length));
				-- Red pixel
				read( fp, byte );
				val := character'pos( byte );
				ptr.data(y)(x).r := bmp_slv8_t(to_unsigned(val, bmp_slv8_t'length));

			end loop;
		end loop;

	end bmp_open;


	procedure bmp_save ( ptr : inout bmp_ptr; filename : in string ) is

		file fp : bmp_file open write_mode is filename;
		variable header_array : bmp_header_array := BMP_STD_HEADER_ARRAY;
		variable byte : character;
		variable val : integer;

		variable tmp_slv32 : bmp_slv32_t;   -- Temporary variable

	begin

		--Inject image width into bitmap header
		tmp_slv32 := bmp_slv32_t(to_signed(ptr.meta.width, bmp_slv32_t'length));
		header_array(21) := tmp_slv32(31 downto 24);
		header_array(20) := tmp_slv32(23 downto 16);
		header_array(19) := tmp_slv32(15 downto 8);
		header_array(18) := tmp_slv32(7 downto 0);
		--Inject image height into bitmap header
		tmp_slv32 := bmp_slv32_t(to_signed(ptr.meta.height, bmp_slv32_t'length));
		header_array(25) := tmp_slv32(31 downto 24);
		header_array(24) := tmp_slv32(23 downto 16);
		header_array(23) := tmp_slv32(15 downto 8);
		header_array(22) := tmp_slv32(7 downto 0);

		-- Write array into bitmap header
		for i in 0 to 53 loop

			val := to_integer(unsigned(header_array(i)));
			byte := character'val(val);

			write( fp, byte );
		end loop;


		-- Write image data
		line : for y in ptr.meta.height-1 downto 0 loop
			pix : for x in 0 to ptr.meta.width -1 loop

				-- Blue pixel
				val := to_integer(unsigned(ptr.data(y)(x).b));
				byte := character'val(val);
				write( fp, byte );
				-- Green pixel
				val := to_integer(unsigned(ptr.data(y)(x).g));
				byte := character'val(val);
				write( fp, byte );
				-- Red pixel
				val := to_integer(unsigned(ptr.data(y)(x).r));
				byte := character'val(val);
				write( fp, byte );

			end loop;
		end loop;

	end bmp_save;


	procedure bmp_get_width ( ptr : inout bmp_ptr; width : out integer) is
	begin
		width := ptr.meta.width;
	end bmp_get_width;


	procedure bmp_get_height ( ptr : inout bmp_ptr; height : out integer) is
	begin
		height := ptr.meta.height;
	end bmp_get_height;


	procedure bmp_get_pix ( ptr : inout bmp_ptr; x: in natural; y : in natural; pix : out bmp_pix ) is
	begin
		pix := ptr.data(y)(x);
	end bmp_get_pix;

	procedure bmp_set_pix ( ptr : inout bmp_ptr; x: in natural; y : in natural; pix : in bmp_pix ) is
	begin
		ptr.data(y)(x) := pix;

		-- Increase image size if nessecary
		if x+1 > ptr.meta.width then
			ptr.meta.width := x+1;
		end if;

		if y+1 > ptr.meta.height then
			ptr.meta.height := y+1;
		end if;
	end bmp_set_pix;


end bmp_pkg;

