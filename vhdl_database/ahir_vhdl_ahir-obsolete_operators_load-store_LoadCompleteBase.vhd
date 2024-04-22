library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library ahir;
use ahir.LoadStorePack.all;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-------------------------------------------------------------------------------
-- at most one req(I) will ever be asserted
-- req/ack follow a pulse protocol. 
-- mreq/mack follow a level protocol.
-------------------------------------------------------------------------------
entity LoadCompleteBase is
  generic (
    ignore_data: boolean := false;
    width: NaturalArray
    );
  port (
    req : in std_logic_vector;
    ack : out std_logic_vector;
    data: out DWordArray2D;
    mreq : out std_logic_vector;
    mack : in  std_logic_vector;
    mtag : in std_logic_vector;
    mdata: in std_logic_vector;
    clk : in std_logic;
    reset : in std_logic);
end LoadCompleteBase;

architecture Behave of LoadCompleteBase is

  type CompleteArray is array(natural range <>, natural range <>) of std_logic;
  signal cbits, cbits_reg, blockbit_reg, ack_mreq : CompleteArray(width'length-1 downto 0, Max(width)-1 downto 0);
  signal request_active, request_active_reg: std_logic_vector(width'length-1 downto 0);
  signal some_request_is_active  : std_logic;
  
  signal there_is_a_request: boolean;
  signal active_request_id : integer range 0 to width'length-1;
  
  signal ldata, data_reg: DWordArray2D(width'length-1 downto 0, Max(width)-1 downto 0);

  signal mreq_sig: std_logic_vector(mreq'length-1 downto 0);
  alias lmreq: std_logic_vector(mreq'length-1 downto 0) is mreq;
  alias lmack: std_logic_vector(mreq'length-1 downto 0) is mack;
  alias lmdata : std_logic_vector(mdata'length-1 downto 0) is mdata;
  alias lmtag : std_logic_vector(mtag'length-1 downto 0) is mtag;
  

  constant lwidth: NaturalArray(width'length-1 downto 0) := width;
  constant tag_width : integer := mtag'length/mreq'length;
    
begin  -- Behave

  assert req'length = width'length
    and req'length = ack'length
    and data'length(1) = width'length
    and data'length(2) = Max(width)
    and mreq'length = Max(width)
    and mack'length = mreq'length
    and mdata'length = LAU*Max(width)
    and mtag'length = (mtag'length/Max(width))*Max(width)
    report "Mismatch in argument lengths" severity error;


  data <= ldata;
  
  -----------------------------------------------------------------------------
  -- per requester ack and complete bit handling logic
  -----------------------------------------------------------------------------
  AckGen: for R in 0 to width'length-1 generate

    
    AckBlock: block
      signal this_req_is_active : boolean;
      signal all_cbits_set : std_logic;
      signal ack_sig: std_logic;
    begin  -- block AckBlock


	-- requests can be served in parallel.
      this_req_is_active <= (req(R) = '1');

      -- all_bits_set will be '1' if all cbits are '1'
      process(cbits)
      begin
        all_cbits_set <= '1';
        for I in 0 to lwidth(R)-1 loop
          if(cbits(R,I) = '0') then
            all_cbits_set <= '0';
            exit;
          end if;
        end loop;  -- I
      end process;
        
      process(clk)
      begin
        if(clk'event and clk = '1') then
          if(reset = '1') then
            request_active_reg(R) <= '0';
          elsif(this_req_is_active and ack_sig = '0') then
            request_active_reg(R) <= '1';
          elsif(ack_sig = '1') then
            request_active_reg(R) <= '0';
          end if;
        end if;
      end process;
      
      request_active(R) <= '1' when this_req_is_active else request_active_reg(R);

      -- assert ack pulse when all cbits are set and if request is active
      ack_sig <= '1' when request_active(R) = '1' and all_cbits_set = '1' else '0';
      ack(R) <= ack_sig;

      -- final cbit is OR of cbit_reg and completion of memory sig
      finalCbit: for J in 0 to Max(width)-1 generate

         -------------------------------------------------------------------------
         -- cbit handling
         -------------------------------------------------------------------------


        Latch: block
          signal mdone : std_logic;
          signal set_cbit, clear_cbit, set_bbit, clear_bbit, latch_datareg: std_logic;
        begin  -- block Latch

	  -- tag matches?
          process(lmtag,lmack(J),this_req_is_active,blockbit_reg)
            variable mt: integer;
	  begin
	     mdone <= '0';
             if(lmack(J) = '1') then	
             	mt := To_Integer(To_Unsigned(lmtag(((J+1)*tag_width)-1 downto J*TAG_WIDTH)));
                
             	-- mdone = '1' indicates that the Jth word for requester R has been read.
		if(mt = R) then
                  if(blockbit_reg(R,J) = '0' or (this_req_is_active)) then
                    mdone  <= '1';
                  end if;
		end if;
	      end if;
          end process;


          process(clk)
		variable clear,set: boolean;
          begin
		clear := false;
		set := false;
		if(clk'event and clk = '1') then
			clear := (reset = '1') or (this_req_is_active and ack_sig = '0');
			set := (reset = '0') and ack_sig = '1';
			if(clear) then
				blockbit_reg(R,J) <= '0';
			elsif(set) then
				blockbit_reg(R,J) <= '1';
			end if;
		end if;
          end process;

          -- set dominant
	  clear_cbit <= ack_sig;
          set_cbit <= mdone; 

          -- latch data reg!
          latch_datareg <= mdone;
    
	  -- mreq  
	  ack_mreq(R,J) <= mdone;

          process(clk)
		variable nxt_v: std_logic;
		variable err_v: std_logic;
          begin
            if(clk'event and clk = '1') then
              if(reset = '1') then
		cbits_reg(R,J) <= '0';
              else
		  if(set_cbit = '1') then
			cbits_reg(R,J) <= '1';
		  elsif(clear_cbit = '1') then
			cbits_reg(R,J) <= '0';
		  end if;
              end if;
            end if;
          end process;

	  -- cbits will be registered.
          cbits(R,J) <= cbits_reg(R,J);

          IgnoreData: if not ignore_data generate
            process(clk)
            begin
              if(clk'event and clk = '1') then
                if latch_datareg = '1' then 
                  data_reg(R,J) <=  lmdata(((J+1)*LAU)-1 downto J*LAU);
                end if;
              end if;
            end process;

            -- final data output port
            ldata(R,J) <=  data_reg(R,J);

          end generate IgnoreData;
        end block Latch;
      end generate finalCbit;
    end block AckBlock;
  end generate AckGen;

  -----------------------------------------------------------------------------
  -- memory request/ack handling
  -----------------------------------------------------------------------------
  process(ack_mreq)
    variable ack_flag : boolean;
    variable mt : integer;
  begin
    mreq_sig <= (others => '0');
    
    for J in lmack'range loop
      if(lmack(J) = '1') then
        ack_flag := false;
        mt := To_Integer(To_Unsigned(lmtag(((J+1)*TAG_WIDTH)-1 downto J*TAG_WIDTH)));                    
        if(ack_mreq(mt,J) = '1') then
            ack_flag := true;
        end if;
        if(ack_flag) then
          mreq_sig(J) <= '1';
        end if;
      end if;
    end loop;
  end process;
  lmreq <= mreq_sig;

  -- some request is active
  some_request_is_active <= OrReduce(request_active);
  
end Behave;
