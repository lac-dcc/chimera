library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;

entity zpuino_rgbctrl is
  generic (
      WIDTH_BITS: integer := 5;
      WIDTH_LEDS: integer := 64;
      PWM_WIDTH: integer := 8;
      REVERSE_SHIFT: boolean := false
  );
  port (
    wb_clk_i: in std_logic;
	 	wb_rst_i: in std_logic;
    wb_dat_o: out std_logic_vector(wordSize-1 downto 0);
    wb_dat_i: in std_logic_vector(wordSize-1 downto 0);
    wb_adr_i: in std_logic_vector(maxIObit downto minIObit);
    wb_we_i:  in std_logic;
    wb_cyc_i: in std_logic;
    wb_stb_i: in std_logic;
    wb_ack_o: out std_logic;
    wb_inta_o:out std_logic;
    --id:       out slot_id;

    displayclk: in std_logic;
    -- RGB outputters

    R:        out std_logic_vector(1 downto 0);
    G:        out std_logic_vector(1 downto 0);
    B:        out std_logic_vector(1 downto 0);

    COL:      out std_logic_vector(3 downto 0);

    CLK:      out std_logic;
    STB:      out std_logic;
    OE:       out std_logic
  );
end entity zpuino_rgbctrl;


architecture behave of zpuino_rgbctrl is

  constant WIDTH: integer := 2**WIDTH_BITS;

  signal clken: std_logic;
  signal transfer: std_logic;
  signal in_transfer: std_logic;-- := '0';

  subtype shreg is std_logic_vector(WIDTH_LEDS-1 downto 0);

  type shifteddatatype is array(0 to 1) of shreg;

  signal shiftout_r,
         shiftout_g,
         shiftout_b,
         shiftdata_r,
         shiftdata_g,
         shiftdata_b: shifteddatatype;

  type shtype is (
    idle,shift,clock,strobe
  );
  signal shstate: shtype;

  signal transfer_count: integer;

  signal ack_transfer: std_logic;-- := '0';

  signal mraddr: std_logic_vector((5+WIDTH_BITS)-1 downto 0);-- := (others => '0');
  signal mrdata: std_logic_vector(31 downto 0);

  signal mren: std_logic;
  signal cpwm: unsigned (PWM_WIDTH downto 0);-- := (others => '0');

  signal column, column_q: unsigned(4 downto 0);-- := (others => '0');
  signal row: unsigned(WIDTH_BITS-1 downto 0);-- := (others => '0');

  subtype colorvaluetype is unsigned(PWM_WIDTH-1 downto 0);
  type utype is array(0 to 3) of colorvaluetype;

  type fillerstatetype is (
    compute,
    send
  );

  signal fillerstate: fillerstatetype := compute;

  signal debug_compresult: std_logic_vector(2 downto 0);
  signal memvalid: std_logic;-- := '0';

  signal ack_q: std_logic;

  signal ramsel: std_logic;
  signal panelsel: std_logic;-- := '0';
  signal invpanelsel: std_logic;-- := '1';

  constant zerovec: std_logic_vector(31 downto 0):=(others => '0');

  function reverse (a: in std_logic_vector)
  return std_logic_vector is
    variable result: std_logic_vector(a'RANGE);
    alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
  begin
    for i in aa'RANGE loop
      result(i) := aa(i);
    end loop;
    return result;
  end;

  signal config_data: std_logic_vector(31 downto 0);
  signal ram_out    : std_logic_vector(31 downto 0);

  constant PWMIGNORE: integer := 8 - PWM_WIDTH;

  signal rst1, rst2, displayrst: std_logic;

begin

  wb_ack_o <= ack_q;
  wb_inta_o <= '0';

  OE <='0';

  ramsel <= wb_cyc_i and wb_stb_i and wb_adr_i(5+WIDTH_BITS+1+1);

  wb_dat_o <= ram_out when wb_adr_i(5+WIDTH_BITS+1+1)='1' else config_data;

  process(wb_rst_i, displayclk)
  begin
    if wb_rst_i='1' then
      rst1<='1';
      rst2<='1';
    elsif rising_edge(displayclk) then
      rst1<=rst2;
      rst2<='0';
    end if;
  end process;

  displayrst<=rst1;

  process(wb_adr_i)
  begin
    config_data <= (others => 'X');
    case wb_adr_i(3 downto 2) is
      when "01" =>
        config_data(15 downto 0) <= std_logic_vector(to_unsigned(32,16));
        config_data(31 downto 16) <= std_logic_vector(to_unsigned(WIDTH_LEDS,16));
      when "10" =>
        -- Pixel format....
        config_data <= (others => 'X');
      when "00" =>
        -- Stride
        config_data(15 downto 0) <= std_logic_vector(to_unsigned(2**WIDTH_BITS, 16));
        -- PWM width
        config_data(31 downto 16) <= std_logic_vector(to_unsigned(2**PWM_WIDTH, 16));

      when others =>
        config_data <= (others => 'X');
    end case;
  end process;


  displayram: entity work.generic_dp_ram
    generic map (
      address_bits => 5+WIDTH_BITS,
      data_bits => 32
    )
    port map (
      clka  => wb_clk_i,
      ena   => ramsel,
      wea   => wb_we_i,
      addra => wb_adr_i(5+WIDTH_BITS+1 downto 2),
      dia   => wb_dat_i,
      doa   => ram_out,
      clkb  => displayclk,
      enb   => mren,
      web   => '0',
      addrb => mraddr,
      dib   => zerovec,
      dob   => mrdata
    );
  


  process(wb_clk_i)
  begin
    if rising_edge(wb_clk_i) then
      if wb_rst_i='1' then
        ack_q<='0';
      else
        ack_q<='0';
        if wb_cyc_i='1' and wb_stb_i='1' and ack_q='0' then
          ack_q<='1';
        end if;
      end if;
    end if;
  end process;

  invpanelsel<=not panelsel;

  --mraddr (9) <= not panelsel;
  --mraddr (8 downto 5) <= column(3 downto 0);
  --mraddr (4 downto 0) <= row(4 downto 0);

  mraddr <= invpanelsel & std_logic_vector(column(3 downto 0)) & std_logic_vector(row(WIDTH_BITS-1 downto 0));

  -- This is an odd way for processing the PWM. Perhaps
  -- we can reorganize the memory ?


  process(displayclk)
    variable ucomp: utype;
    variable mword: unsigned(31 downto 0);
    variable compresult: std_logic_vector(2 downto 0);
    variable panel: integer;
  begin
    if rising_edge(displayclk) then
      if displayrst='1' then
        mren<='0';
        panelsel<='0';
        row<=(others => '0');
        column<=(others => '0');
        transfer<='0';
        cpwm<=(others => '0');
      else

        memvalid <= mren;
  
        case fillerstate is
          when compute =>
  
            mren <= '1';
            if mren='1' and row/=WIDTH_LEDS then
             if panelsel='1' then
              row <= row + 1;
             end if;
             panelsel <= not panelsel;
            end if;
  
            if memvalid='1' then
              -- We have valid data;
  
              if (row=WIDTH_LEDS) then
                fillerstate <= send;
                mren<='0';
                row<=(others =>'0');
                transfer<='1';
                column_q <= column;
              end if;
  
              if panelsel='1' then
                panel:=1;
              else
                panel:=0;
              end if;
          
  
              -- Validate if PWM bit for this LED should be '1' or '0'
      
                -- We need to decompose into the individual components
                mword := unsigned(mrdata);
  
                ucomp(2) := mword(7 downto 0+PWMIGNORE);
                ucomp(1) := mword(15 downto 8+PWMIGNORE);
                ucomp(0) := mword(23 downto 16+PWMIGNORE);
  
                -- Compare output for each of them
  
                comparepwm: for j in 0 to 2 loop
                  if (ucomp(j)>cpwm(PWM_WIDTH-1 downto 0)) then
                    compresult(j):='1';
                  else
                    compresult(j):='0';
                  end if;
                end loop;
  
                -- At this point we have the comparation. Shift it into the correct
                -- registers.
                if REVERSE_SHIFT then
                  shiftdata_r(panel) <= compresult(0) & shiftdata_r(panel)(WIDTH_LEDS-1 downto 1);
                  shiftdata_g(panel) <= compresult(1) & shiftdata_g(panel)(WIDTH_LEDS-1 downto 1);
                  shiftdata_b(panel) <= compresult(2) & shiftdata_b(panel)(WIDTH_LEDS-1 downto 1);
                else
                  shiftdata_r(panel) <= shiftdata_r(panel)(WIDTH_LEDS-2 downto 0) & compresult(0);
                  shiftdata_g(panel) <= shiftdata_g(panel)(WIDTH_LEDS-2 downto 0) & compresult(1);
                  shiftdata_b(panel) <= shiftdata_b(panel)(WIDTH_LEDS-2 downto 0) & compresult(2);
                end if;
  
              if row=WIDTH_LEDS then
                -- Advance pwm counter
                cpwm <= cpwm + 1;
                --column(4)<='0';
              end if;
            end if;
  
          when send =>
            if ack_transfer='1' then
              mren<='1';
              fillerstate<=compute;
              transfer<='0';
              if cpwm(cpwm'HIGH)='1' then
                column <= column + 1;
                cpwm(cpwm'HIGH)<='0';
              end if;
            end if;
    
        end case;
      end if;
    end if;

    debug_compresult <= compresult;

  end process;

  -- Main outputter process.

  process(displayclk)
  begin
    if rising_edge(displayclk) then
      STB<='0';
      CLK<='0';
      ack_transfer<='0';
      case shstate is
        when idle =>
          if transfer='1' then
            -- Load shift registers.
            for i in 0 to 1 loop
              -- Reverse all bits here.
              shiftout_r(i) <= reverse( shiftdata_r(i) );
              shiftout_g(i) <= reverse( shiftdata_g(i) );
              shiftout_b(i) <= reverse( shiftdata_b(i) );
            end loop;
            in_transfer<='1';
            transfer_count <= WIDTH_LEDS-1;
            shstate<=clock;
            ack_transfer <='1';
          end if;

        when shift =>

          -- Shift data out.

          for i in 0 to 1 loop -- Array number
              shiftout_r(i) <= 'X' & shiftout_r(i)(WIDTH_LEDS-1 downto 1);
              shiftout_g(i) <= 'X' & shiftout_g(i)(WIDTH_LEDS-1 downto 1);
              shiftout_b(i) <= 'X' & shiftout_b(i)(WIDTH_LEDS-1 downto 1);
          end loop;

          shstate<=clock;

        when clock =>

          transfer_count <= transfer_count - 1;

          CLK<='1';
          if transfer_count=0 then
            shstate <= strobe;
          else
            shstate <= shift;
          end if;

        when strobe =>
          STB <= '1';
          COL <= std_logic_vector(column_q(3 downto 0));
          shstate <= idle;

      end case;

    end if;

  end process;

  -- Assign outputs
  ol: for i in 0 to 1 generate
    R(i) <= shiftout_r(i)(0);
    G(i) <= shiftout_g(i)(0);
    B(i) <= shiftout_b(i)(0);
  end generate;

end behave;










