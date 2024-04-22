------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- a basic unsigned multiplier.
--
-- for the moment, this just does a multiply and adds delay stages at
-- the end; presumably, the synthesis tool will retime things
-- appropriately..
--
-- TODO: pipeline this explicitly!
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DelayCell is
   generic (operand_width: integer; delay: natural);
   port (Din: in unsigned(operand_width-1 downto 0);
	 Dout: out unsigned(operand_width-1 downto 0);
	 clk: in std_logic;
	 stall: in std_logic);
end entity DelayCell;

architecture Behave of DelayCell is
	type DArray is array (natural range <>) of unsigned(operand_width-1 downto 0);
	signal data_array: DArray(0 to delay);
begin

	data_array(0) <= Din;
	NonZeroDelay: if delay > 0 generate
	   SRgen: for I in 1 to delay generate
		process(clk)
		begin
			if(clk'event and clk = '1') then
				if(stall = '0') then
					data_array(I) <= data_array(I-1);
				end if;
			end if;
			
		end process;
	    end generate SRgen;
	end generate NonZeroDelay;
	
	Dout <= data_array(delay);
end Behave;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SumCell is
 	generic (operand_width: integer; ignore_diag: boolean; ignore_right: boolean);
	port (SU,SDiagIn: in unsigned(operand_width-1 downto 0);
              SR: in unsigned(1 downto 0);
	      SDiagOut: out unsigned(operand_width-1 downto 0);
	      SL: out unsigned(1 downto 0);
	      stall: in std_logic;
	      clk: in std_logic);
end entity SumCell;

architecture Behave of SumCell is
begin

	process(clk)
		variable x, y, z, sum: unsigned(operand_width+1 downto 0);
		variable t: unsigned(1 downto 0);
	begin

		if(clk'event and clk = '1') then
                        y := (others => '0');
			if(stall = '0') then
				x := "00" & SU;

				-- y := (1 => SR(1), 0 => SR(0), others => '0');
                                y(1) := SR(1);
                                y(0) := SR(0);

				z := "00" & SDiagIn;
		
				if(not (ignore_diag  or ignore_right)) then
					sum := x + y + z;
				elsif (ignore_diag and ignore_right) then
					sum := x;
				elsif (ignore_diag and (not ignore_right)) then
					sum := (x + y);
				else
					sum := (x + z);
				end if;
	
				t := sum(operand_width+1 downto operand_width);

				SDiagOut <= sum(operand_width-1 downto 0);
				SL <= t;
			end if;
		end if;
	end process;
end Behave;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MultiplierCell is
  generic (operand_width: integer);
  port (MT, MR, ST, DiagIn: in unsigned(operand_width-1 downto 0);
        ML, MD, SD, DiagOut: out unsigned(operand_width-1 downto 0);
        stall: in std_logic;
	clk: in std_logic);
end entity MultiplierCell;

architecture Simple of MultiplierCell is
	constant zero_const : unsigned(operand_width-2 downto 0) := (others => '0');
begin

	-- sent through without any delay.
	ML <= MR;

	process(clk)
		variable tmp,wext: unsigned((2*operand_width)-1 downto 0);
		variable u, v, w: unsigned(operand_width downto 0);
	begin
		if(clk'event and clk = '1') then
			if(stall = '0') then
				tmp := MT*MR;
		
				-- pad one bit to incoming summands.
				u :=  "0" & DiagIn;
                                v :=  "0" & ST;
		
				-- this is a operand_width+1 size addition
				w := (u + v);

				-- pad to 2*operand_width
				wext := zero_const & w;
		
				-- a full 2*operand_width addition.
				tmp := tmp + wext;

				-- send down the vertical operand
				-- with a cycle delay.
				MD <= MT;

				-- top half of result goes down to 
				-- next row (to be summed)
				SD <= tmp((2*operand_width)-1 downto operand_width);

				-- bottom half of the result goes out
				-- on the diagonal..
				DiagOut <= tmp(operand_width-1 downto 0);
			end if;
		end if;
	end process;
end Simple;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;

entity UnsignedMultiplier is
  
  generic (
    name: string;
    tag_width     : integer;
    operand_width : integer;
    chunk_width   : integer := 8);

  port (
    L, R       : in  unsigned(operand_width-1 downto 0);
    RESULT     : out unsigned((2*operand_width)-1 downto 0);
    clk, reset : in  std_logic;
    in_rdy     : in  std_logic;
    out_rdy    : out std_logic;
    stall      : in std_logic;
    tag_in     : in std_logic_vector(tag_width-1 downto 0);
    tag_out    : out std_logic_vector(tag_width-1 downto 0));
end entity;

architecture Pipelined of UnsignedMultiplier is

  constant pipe_depth : integer := operand_width/16;

  type RWORD is array (natural range <>) of unsigned((2*operand_width)-1 downto 0);
  type TWORD is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);  


  signal intermediate_results : RWORD(0 to pipe_depth);
  signal intermediate_tags : TWORD(0 to pipe_depth);  
  signal stage_active : std_logic_vector(0 to pipe_depth);
  
begin  -- Pipelined

  -- for now, just multiply..
  intermediate_results(0) <= L*R;


  -- I/O
  intermediate_tags(0) <= tag_in;
  stage_active(0) <= in_rdy;
  out_rdy <= stage_active(pipe_depth);
  tag_out <= intermediate_tags(pipe_depth);
  RESULT <= intermediate_results(pipe_depth);
  
  -- for now, just add stages after the multiply
  -- the synthesis tool should retime.  Later
  -- we'll get around to doing the array multiplier
  -- right.
  Pipeline: for STAGE in 1 to pipe_depth generate

    process(clk)
    begin
      if(clk'event and clk = '1') then
        if(reset = '1') then
          stage_active(STAGE) <= '0';
        elsif(stall = '0') then
          stage_active(STAGE) <= stage_active(STAGE-1);
        end if;

        if(stall = '0') then
          intermediate_results(STAGE) <= intermediate_results(STAGE-1);
          intermediate_tags(STAGE) <= intermediate_tags(STAGE-1);
        end if;
        
      end if;
    end process;
    
  end generate Pipeline;
end Pipelined;


 
architecture ArrayMul of UnsignedMultiplier is

	constant NumChunks : integer := Ceil(operand_width, chunk_width);

	constant padded_operand_width: integer  := NumChunks*chunk_width;
	signal Lpadded, Rpadded: unsigned(padded_operand_width-1 downto 0);
	signal RESULTpadded: unsigned((2*padded_operand_width)-1 downto 0);

	type TwoDTagArray is array (natural range <>) of std_logic_vector(tag_width-1 downto 0);
	signal tag_array: TwoDTagArray(0 to 2*NumChunks);

	type TwoDChunkArray is array (natural range <>, natural range <>) of unsigned(chunk_width-1 downto 0);
	signal MT, ML, ST, DiagIn, SD, MR, MD, DiagOut: TwoDChunkArray(0 to NumChunks-1, 0 to NumChunks-1);



	signal rdy_array: std_logic_vector(0 to 2*NumChunks);

        -- the multiplier cells are arranged in a NumChunk X NumChunk array.
        -- Cell (I,J) receives R(I) (MT),  L(J) (MR) and a partial sum from above (ST).
	-- Cell (I,J) receives an incoming diagonal sum from Cell (I-1,J+1) and
        -- passes on its sum to the diagonal block Cell (I+1,J-1).
	--
	component DelayCell 
   		generic (operand_width: integer; delay: natural);
   		port (Din: in unsigned(operand_width-1 downto 0);
	 		Dout: out unsigned(operand_width-1 downto 0);
	 		clk: in std_logic;
	 		stall: in std_logic);
	end component DelayCell;

	component MultiplierCell is
  		generic (operand_width: integer);
  		port (MT, MR, ST, DiagIn: in unsigned(operand_width-1 downto 0);
        		ML, MD, SD, DiagOut: out unsigned(operand_width-1 downto 0);
        		stall: in std_logic;
			clk: in std_logic);
	end component MultiplierCell;

	component SumCell is
 		generic (operand_width: integer; ignore_diag: boolean; ignore_right: boolean);
		port (SU,SDiagIn: in unsigned(operand_width-1 downto 0);
              		SR: in unsigned(1 downto 0);
	      		SDiagOut: out unsigned(operand_width-1 downto 0);
	      		SL: out unsigned(1 downto 0);
	      		stall: in std_logic;
	      		clk: in std_logic);
	end component SumCell;

	type OneDChunkArray is array (natural range <>) of unsigned(chunk_width-1 downto 0);
	signal SU,SDiagIn,SDiagOut: OneDChunkArray(0 to NumChunks-1);

	type OneD2BitArray is array (natural range <>) of unsigned(1 downto 0);
        signal SR,SL: OneD2BitArray(0 to NumChunks-1);

	signal result_array : OneDChunkArray(0 to (2*NumChunks)-1);
begin

	process(L)
		variable lpad : unsigned(padded_operand_width-1 downto 0);
	begin
		lpad := (others => '0');
		lpad(operand_width-1 downto 0) := L;
		Lpadded <= lpad;
	end process;

	process(R)
		variable rpad : unsigned(padded_operand_width-1 downto 0);
	begin
		rpad := (others => '0');
		rpad(operand_width-1 downto 0) := R;
		Rpadded <= rpad;
	end process;

	RESULT <= RESULTpadded((2*operand_width)-1 downto 0);

	tag_array(0) <= tag_in;
	rdy_array(0) <= in_rdy;
	
	Tags: for ROW in 1 to (2*NumChunks) generate
		process(clk)
		begin
			if(clk'event and clk = '1') then
				if(reset = '1') then
					rdy_array(ROW) <= '0';
					tag_array(ROW) <= (others => '0');
				elsif(stall = '0') then
					tag_array(ROW) <= tag_array(ROW-1);
					rdy_array(ROW) <= rdy_array(ROW-1);
				end if;
			end if;
		end process;
	end generate Tags;
	tag_out <= tag_array(2*NumChunks);
	out_rdy <= rdy_array(2*NumChunks);

	Rows: for ROW in 0 to NumChunks-1 generate
		Cols: for COL in 0 to NumChunks-1 generate

			-- incoming  L values get into MT(0,-).
			ROWBC: if ROW = 0 generate
                                MT(ROW,COL) <= Lpadded(((COL+1)*chunk_width)-1 downto (COL*chunk_width));

				-- incoming signals to top row are 0.
				DiagIn(ROW,COL) <= (others => '0');
				ST(ROW,COL) <= (others => '0');

			end generate ROWBC;

		        COLBC: if COL=NumChunks-1 and ROW>0 generate
				-- left border column has incoming diagonals 0
				DiagIn(ROW,COL) <= (others => '0');
			end generate COLBC;

			-- from the right, R values enter with each row 
			-- getting an appropriate delay.
			COLBC2: if COL = 0 generate
				delInst: DelayCell generic map(operand_width => chunk_width,
								delay => ROW)
					port map(Din => Rpadded(((ROW+1)*chunk_width)-1 downto (ROW*chunk_width)),
						 Dout => MR(ROW,COL),
						 clk => clk,
						 stall => stall);
			end generate COLBC2;

			-- passing from right to left.
			Cols1: if COL > 0 generate
				MR(ROW,COL) <= ML(ROW,COL-1);
			end generate Cols1;

			ConnectArray: if ROW>0 generate

				-- from top to bottom
				MT(ROW,COL) <= MD(ROW-1,COL);
				ST(ROW,COL) <= SD(ROW-1,COL);
				
				-- diagonally.
				Cols2: if COL < NumChunks-1 generate
					DiagIn(ROW,COL) <= DiagOut(ROW-1,COL+1);
				end generate Cols2;
			end generate ConnectArray;

			mulCell: MultiplierCell generic map(operand_width => chunk_width)
				port map(MT => MT(ROW,COL),
					 ML => ML(ROW,COL),
					 ST => ST(ROW,COL),
					 DiagIn => DiagIn(ROW,COL),
					 SD => SD(ROW,COL),
					 MR => MR(ROW,COL),
					 MD => MD(ROW,COL),
					 stall => stall,
					 DiagOut => DiagOut(ROW,COL),
					 clk => clk);
		end generate Cols;
	end generate Rows;


	--  instantiate an array of sum cells to take
	--  care of the SD correction.
	sumArray: for Cols in 0 to NumChunks-1 generate
	
		scell: SumCell generic map (operand_width => chunk_width,
						ignore_diag => (Cols = NumChunks-1),
						ignore_right => (Cols = 0))
			port map(SU => SU(Cols),
				 SDiagIn => SDiagIn(Cols),
				 SR => SR(Cols),
				 SDiagOut => SDiagOut(Cols),
				 SL => SL(Cols),
				 stall => stall,
				 clk => clk);

		BR: if(Cols = 0) generate
			-- 0s from the right at the right boundary
			SR(Cols) <= (others => '0');
		end generate BR;
				
		BL: if(Cols = NumChunks-1) generate
			-- 0s from the diagonal at the left boundary.
			SDiagIn(Cols) <= (others => '0');
		end generate BL;

		--   inputs to the cells are delayed to match the sum
		--   propagation.

		--  sum coming down..
		dSU: DelayCell generic map(operand_width => chunk_width, delay => Cols)
			port map(Din => SD(NumChunks-1,Cols),
				 Dout => SU(Cols),
				 clk => clk,
				 stall => stall);
		
		Cntr1: if(Cols > 0) generate
			SR(Cols) <= SL(Cols-1);
		end generate Cntr1;
		
		Cntr2: if (Cols < NumChunks-1) generate
			-- diagonal coming in..  the leftmost cell has no incoming diagonal.
			dSDiagIn: DelayCell generic map(operand_width => chunk_width, delay => Cols)
				port map(Din => DiagOut(NumChunks-1,Cols+1),
				 Dout => SDiagIn(Cols),
				 clk => clk,
				 stall => stall);
		end generate Cntr2;
		
	end generate sumArray;


	--       instantiate delay elements to match delays
        --       inserted due to sum-cell array.


	-- the right column has 2*N-1 delays inserted.
	RightColumn:  for Rows in 0 to NumChunks-1 generate
		dRc: DelayCell generic map(operand_width => chunk_width, delay => ((2*NumChunks)-1) - Rows)
			port map(Din => DiagOut(Rows,0),
				 Dout => result_array(Rows),
				 stall => stall,
				 clk => clk);
	end generate RightColumn;

	-- the bottom row has N-C delays inserted as C goes from 0 to N-2
	BottomRow: for Cols in 0 to NumChunks-2 generate
		dBr: DelayCell generic map(operand_width => chunk_width, delay => NumChunks-(Cols+1))
			port map(Din => SDiagOut(Cols),
				 Dout => result_array(Cols+NumChunks),
				 stall => stall,
				 clk => clk);
		
	end generate BottomRow;

	-- leftmost element has no delays inserted.
	result_array((2*NumChunks)-1) <= SDiagOut(NumChunks-1);


	-- result: pack the diagonals into the result vector.
	process(result_array)
	begin
		for I in 0 to (2*NumChunks)-1 loop
			RESULTpadded(((I+1)*chunk_width)-1 downto (I*chunk_width))
				<= result_array(I);
		end loop;
	end process;

end ArrayMul;
