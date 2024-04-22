----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: icape_controller - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- In-system access to ICAPE2 module. Basically a Master SelectMAP controller.
--
-- Assumes clock frequency of 156.25MHz
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VComponents.all;

entity icape_controller is
        generic (
        BUFR_CLK_DIV_G : string := "4");
	port(
	clk : in std_logic;
	rst : in std_logic;
        
        -- ICAPE CONTROLLER REGISTER INTERFACE
        icape_write_data           : in std_logic_vector(31 downto 0);
        icape_read_data            : out std_logic_vector(31 downto 0);
        icape_read_nwrite          : in std_logic;
        icape_start_transaction    : in std_logic;
        icape_transaction_complete : out std_logic);
end icape_controller;

--}} End of automatically maintained section

architecture arch_icape_controller of icape_controller is

    type T_ICAPE_CONTROLLER_STATE is (
    IDLE,
    WAIT_FOR_FALLING_EDGE,
    WRITE_SETUP,
    DO_WRITE,
    WRITE_RECOVER,
    READ_DELAY_1,
    READ_DELAY_2,
    READ_DELAY_3);
    
    component strobe_gen
    port(
        reset		 : in std_logic;
        signal_in	 : in std_logic;	
        clock_out	 : in std_logic;
        strobe_out	 : out std_logic);
    end component;

    --signal icape_clk_count : std_logic_vector(3 downto 0);
    --signal icape_rising_edge : std_logic;
    signal icape_falling_edge : std_logic;

    signal icape_clk : std_logic;
    signal icape_clk_hist : std_logic;
    signal icape_csib : std_logic;
    signal icape_din : std_logic_vector(31 downto 0);
    signal icape_dout : std_logic_vector(31 downto 0);
    signal icape_dout_bit_swapped : std_logic_vector(31 downto 0);
    signal icape_rdwrb : std_logic;

    signal current_icape_controller_state : T_ICAPE_CONTROLLER_STATE;
    signal start_transaction : std_logic;
    
    signal icape_csib_z1 : std_logic;
    signal icape_csib_z2 : std_logic;
    
begin

----------------------------------------------------------------------
-- GENERATE ICAPE CLOCK
----------------------------------------------------------------------
    
    --gen_icape_clk_count : process(rst, clk)
    --begin
    --    if (rst = '1')then
    --        icape_clk_count <= "0000";
    --    elsif (rising_edge(clk))then
    --        if (icape_clk_count = "1111")then
    --            icape_clk_count <= "0000";
    --        else
    --            icape_clk_count <= icape_clk_count + "0001";
    --        end if;
    --    end if;
    --end process;
    
    
    gen_icape_clk_falling_edge_detect : process(rst, clk)
    begin
        if (rst = '1')then
            icape_falling_edge <= '0';
            icape_clk_hist <= '0';
        elsif (rising_edge(clk))then
            icape_clk_hist <= icape_clk;
            --detect falling edge of icape_clk
            if (icape_clk = '0' and icape_clk_hist = '1')then
                icape_falling_edge <= '1';
            else
                icape_falling_edge <= '0';
            end if;
        end if;
    end process;    
    
    BUFR_ICAPE2 : BUFR
       generic map (
         BUFR_DIVIDE => BUFR_CLK_DIV_G)
       port map (
         CE => '1',
         CLR => '0',
         I => clk,
         O => icape_clk);
         
    --icape_clk <= icape_clk_count(3);

    --icape_rising_edge <= '1' when (icape_clk_count = "0111") else '0';
    --icape_falling_edge <= '1' when (icape_clk_count = "1111") else '0';

----------------------------------------------------------------------
-- STATE MACHINE TO GENERATE REQUIRED ICAPE TIMING
----------------------------------------------------------------------
    
    strobe_gen_0 : strobe_gen
    port map(
        reset         => rst,
        signal_in     => icape_start_transaction,    
        clock_out     => clk,
        strobe_out    => start_transaction);
    
    gen_current_icape_controller_state : process(rst, clk)
    begin
        if (rst = '1')then
            icape_read_data <= (others => '0');
            current_icape_controller_state <= IDLE;
        elsif (rising_edge(clk))then
            case current_icape_controller_state is
                when IDLE =>
                current_icape_controller_state <= IDLE;
                
                if (start_transaction = '1')then
                    current_icape_controller_state <= WAIT_FOR_FALLING_EDGE;
                end if;
                
                when WAIT_FOR_FALLING_EDGE =>
                current_icape_controller_state <= WAIT_FOR_FALLING_EDGE;
                
                if (icape_falling_edge = '1')then
                    if (icape_read_nwrite = '0')then
                        current_icape_controller_state <= WRITE_SETUP;
                    else
                        current_icape_controller_state <= READ_DELAY_1;
                    end if;
                end if;
                
                when WRITE_SETUP =>
                current_icape_controller_state <= WRITE_SETUP;
                
                if (icape_falling_edge = '1')then
                    current_icape_controller_state <= DO_WRITE;
                end if;                
                
                when DO_WRITE =>
                current_icape_controller_state <= DO_WRITE;
                
                if (icape_falling_edge = '1')then
                    current_icape_controller_state <= WRITE_RECOVER;
                end if;
                
                when WRITE_RECOVER =>
                current_icape_controller_state <= WRITE_RECOVER;
                
                if (icape_falling_edge = '1')then
                    current_icape_controller_state <= IDLE;
                end if;                
                
                when READ_DELAY_1 =>
                current_icape_controller_state <= READ_DELAY_1;
                
                if (icape_falling_edge = '1')then
                    current_icape_controller_state <= READ_DELAY_2;
                end if;                
                
                when READ_DELAY_2 =>
                current_icape_controller_state <= READ_DELAY_2;
                
                if (icape_falling_edge = '1')then
                    current_icape_controller_state <= READ_DELAY_3;
                end if;                
                
                when READ_DELAY_3 =>
                current_icape_controller_state <= READ_DELAY_3;
                
                if (icape_falling_edge = '1')then
                    icape_read_data <= icape_dout_bit_swapped;
                    current_icape_controller_state <= IDLE;
                end if;                
                
            end case;
        end if;
    end process;
    
    icape_transaction_complete <= '1' when (current_icape_controller_state = IDLE) else '0';
    
    gen_icape_ctrl : process(current_icape_controller_state)
    begin
        case current_icape_controller_state is
            when IDLE | WAIT_FOR_FALLING_EDGE =>
            icape_csib <= '1';
            icape_rdwrb <= '1'; 
            
            when WRITE_SETUP | WRITE_RECOVER =>
            icape_csib <= '1';
            icape_rdwrb <= '0'; 
            
            when DO_WRITE =>
            icape_csib <= '0';
            icape_rdwrb <= '0'; 
            
            when READ_DELAY_1 | READ_DELAY_2 | READ_DELAY_3 =>
            icape_csib <= '0';
            icape_rdwrb <= '1'; 
        
        end case;
    end process;
  
-----------------------------------------------------------------------
-- SELECTMAP / ICAPE REQUIRES BIT SWAPPING IN EACH BYTE
-----------------------------------------------------------------------

    generate_icape_din : for a in 0 to 7 generate
        icape_din(a) <= icape_write_data(7 - a);
        icape_din(8 + a) <= icape_write_data(15 - a);
        icape_din(16 + a) <= icape_write_data(23 - a);
        icape_din(24 + a) <= icape_write_data(31 - a);
    end generate generate_icape_din;
    
    generate_icape_dout_bit_swapped : for b in 0 to 7 generate
        icape_dout_bit_swapped(b) <= icape_dout(7 - b);
        icape_dout_bit_swapped(8 + b) <= icape_dout(15 - b);
        icape_dout_bit_swapped(16 + b) <= icape_dout(23 - b);
        icape_dout_bit_swapped(24 + b) <= icape_dout(31 - b);
    end generate generate_icape_dout_bit_swapped;
      
-----------------------------------------------------------------------
-- ICAPE2 COMPONENT
-----------------------------------------------------------------------

    ICAPE2_0 : ICAPE2
    generic map (
        DEVICE_ID => X"3651093",
        ICAP_WIDTH => "X32",
        SIM_CFG_FILE_NAME => "NONE")    
    port map(
        CLK     => icape_clk,
        CSIB    => icape_csib,
        I       => icape_din,
        O       => icape_dout,
        RDWRB   => icape_rdwrb);

--    gen_icape2_sim : process
--    variable icape_value : std_logic_vector(31 downto 0);
--    begin
--        icape_value := (others => '0');
--        icape_dout <= (others => '0');
--        loop 
--            wait until rising_edge(icape_clk);
--            icape_dout <= (others => '0');
    
--            if ((icape_csib = '0')and(icape_rdwrb = '0'))then
--                icape_value := icape_din;
--            end if;
            
--            if ((icape_csib_z2 = '0')and(icape_rdwrb = '1'))then
--                icape_dout <= icape_value;
--            end if;
--        end loop;
--    end process;

--    gen_icape_csib_z : process(icape_clk)
--    begin
--        if (rising_edge(icape_clk))then
--            icape_csib_z1 <= icape_csib;
--            icape_csib_z2 <= icape_csib_z1;
--        end if;
--    end process;

end arch_icape_controller;
