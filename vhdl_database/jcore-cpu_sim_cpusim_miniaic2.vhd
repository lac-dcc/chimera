library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use work.cpu2j0_pack.all;

entity cpusim_miniaic2 is
        port (
        clk_sys : in std_logic;
        rst_i : in std_logic;
        cpa : in cop_o_t;
        cpy : out cop_i_t );
end cpusim_miniaic2;

-- VHD code size information aic2.vh  d          (916 lines (including pkg)),
--                           this cpusim_miniaic2 136 lines,
--                           only copr inst func.

architecture fullrw of cpusim_miniaic2 is

type sbu_regf_t is array (0 to 9) of std_logic_vector(31 downto 0);

  type aicmtwo_reg_t is record
    sbu_regfile    : sbu_regf_t;
    sbu_num_ex     : std_logic_vector(4 downto 0);
    sbu_wnum_ma     : std_logic_vector(4 downto 0);
    sbu_rnum_ma     : std_logic_vector(4 downto 0);
    sbu_oplds_ma   : std_logic;
  end record;

  constant AIC2M_REG_RESET : aicmtwo_reg_t := (
     ((others => '0'),   (others => '0'),   (others => '0'),
      (others => '0'),   (others => '0'),   (others => '0'),
      (others => '0'),   (others => '0'),   (others => '0'),
      (others => '0')), -- sbu_regfile    : sbu_regf_t; general rw reg file
      (others => '0'),   -- sbu_num_ex     : std_logic_vector(3 downto 0);
      (others => '0'),   -- sbu_wnum_ma     : std_logic_vector(3 downto 0);
      (others => '0'),   -- sbu_wnum_ma     : std_logic_vector(3 downto 0);
                 '0'     -- sbu_oplds_ma
  );
  signal this_c : aicmtwo_reg_t;
  signal this_r : aicmtwo_reg_t := AIC2M_REG_RESET;
begin
  p0 : process (this_r, rst_i, cpa )
    variable this : aicmtwo_reg_t;
  -- --------------------------------------------------------------------------
  -- variables
  -- --------------------------------------------------------------------------
  variable nx : aicmtwo_reg_t;
  --
  variable wnum_ma_4b : std_logic_vector( 3 downto 0);
  --
  variable sbu_cpa_op8b : std_logic_vector( 7 downto 0);
  --
  variable tmp5b : std_logic_vector( 4 downto 0);

  begin -- begin of process ( )
     this := this_r;
  nx := this; -- set all nx variable

  -- part 6 SBU coprcessor control, general = ---------------------------------
  -- ------- full bit SBR0-SBR7 assumption ------------------------------------

  -- read write register number (ID stage combinational) ----------------------
  if(cpa.stallcp = '1') then
       nx.sbu_num_ex := this.sbu_num_ex;
  else nx.sbu_num_ex := '0' & cpa.rna; end if;

  if(cpa.stallcp = '1') then
       nx.sbu_rnum_ma := this.sbu_rnum_ma;
  else nx.sbu_rnum_ma := this.sbu_num_ex; end if;

  -- write number (EX stage combinational) ------------------------------------
  sbu_cpa_op8b := b"000" & cpa.op; -- to display 8 bit x"@@"

                             tmp5b := (others => '0');
  if(cpa.stallcp = '1') then tmp5b := this.sbu_wnum_ma;
  elsif(cpa.en = '1') then
    case sbu_cpa_op8b is
    when x"1d" | x"11" => tmp5b := '1' & x"9"; -- op_1d=LDS, 11=CLDS
    when x"10" => -- op_10=CSTS
      if(this.sbu_num_ex(3) = '0') or
        (this.sbu_num_ex = x"8") then -- decode write to SBR0-SBR8
                             tmp5b := '1' & this.sbu_num_ex(3 downto 0);
      end if;
    when others => -- STS and NOP's
    end case;
  end if;
  nx.sbu_wnum_ma := tmp5b;

  if(cpa.stallcp = '1') then nx.sbu_oplds_ma := this.sbu_oplds_ma;
  elsif(sbu_cpa_op8b = x"1d") then
                             nx.sbu_oplds_ma := '1';
  else                       nx.sbu_oplds_ma := '0'; end if;

  -- write (MA stage combinational) -------------------------------------------

  wnum_ma_4b := this.sbu_wnum_ma(3 downto 0); -- for multiple reference

  if(cpa.stallcp = '0') and (this.sbu_wnum_ma(4) = '1') then
    if(this.sbu_wnum_ma(3 downto 0) = x"9") then
      if(this.sbu_oplds_ma = '1') then
           nx.sbu_regfile(9) := cpa.d; -- LDS update
      else nx.sbu_regfile(9) :=
         this.sbu_regfile(to_integer(unsigned(this.sbu_rnum_ma(2 downto 0)))) ;
        -- CLDS update
      end if;
    else
      if   (wnum_ma_4b(3) = '0') or
           (wnum_ma_4b = x"8") then
             nx.sbu_regfile(to_integer(unsigned(wnum_ma_4b))) :=
           this.sbu_regfile(9);         -- CSTS update
      end if;
    end if; -- end of if(this.sbu_wnum_ma(3) = '1') ...
  end if; -- end of if(cpa.stallcp = '0') ...

  this := nx; -- all ff update
  this_c <= this;
  end process;

  p0_r0 : process(clk_sys, rst_i)
  begin
     if rst_i='1' then
        this_r <= AIC2M_REG_RESET;
     elsif clk_sys='1' and clk_sys'event then
        this_r <= this_c;
     end if;
  end process;

  -- from here the context is outside of process statement --------
  -- part 12. output ----------------------------------------------------------
  cpy.ack <= cpa.en; -- return same cycle
  cpy.d <= this_r.sbu_regfile(9);
  cpy.exc <= '0';
  cpy.t <= '0';

end fullrw;
