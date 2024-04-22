--------------------------------------------------------------------------------
-- File       : gmii_to_sgmii_rx_elastic_buffer.vhd
-- Author     : Xilinx Inc.
--------------------------------------------------------------------------------
-- (c) Copyright 2007-2008 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 
-- 
-- 
------------------------------------------------------------------------
-- Description: This is the Receiver Elastic Buffer for the design
--              example of the 1G/2.5G Ethernet PCS/PMA or SGMII
--              core.
--
--              The FIFO is created from internal Memory, is of data width
--              32 (2 characters wide plus status) and is of depth 64
--              words.  This is twice the size of the elastic buffer in
--              the tranceiver which has been bypassed,
--
--              When the write clock is a few parts per million faster
--              than the read clock, the occupancy of the FIFO will
--              increase and Idles should be removed.
--
--              When the read clock is a few parts per million faster
--              than the write clock, the occupancy of the FIFO will
--              decrease and Idles should be inserted.  The logic in
--              this example design will always insert as many idles as
--              necessary in every Inter-frame Gap period to restore the
--              FIFO occupancy.
--
--              Note: the Idle /I2/ sequence is used as the clock
--              correction character.  This is made up from a /K28.5/
--              followed by a /D16.2/ character.



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library unisim;
use unisim.vcomponents.all;



--------------------------------------------------------------------------------
-- The entity declaration for the Rx Elastic Buffer
--------------------------------------------------------------------------------
entity gmii_to_sgmii_rx_elastic_buffer is

   port (

      -- Signals received from the tranceiver on RXRECCLK.

      rxrecclk                  : in  std_logic;
      rxrecreset                : in  std_logic;
      rxchariscomma_rec         : in  std_logic_vector(1 downto 0);
      rxcharisk_rec             : in  std_logic_vector(1 downto 0);
      rxdisperr_rec             : in  std_logic_vector(1 downto 0);
      rxnotintable_rec          : in  std_logic_vector(1 downto 0);
      rxrundisp_rec             : in  std_logic_vector(1 downto 0);
      rxdata_rec                : in  std_logic_vector(15 downto 0);

      -- Signals reclocked onto RXUSRCLK2.

      rxusrclk2                 : in  std_logic;
      rxreset                   : in  std_logic;
      rxchariscomma_usr         : out std_logic;
      rxcharisk_usr             : out std_logic;
      rxdisperr_usr             : out std_logic;
      rxnotintable_usr          : out std_logic;
      rxrundisp_usr             : out std_logic;
      rxclkcorcnt_usr           : out std_logic_vector(2 downto 0);
      rxbuferr                  : out std_logic;
      rxdata_usr                : out std_logic_vector(7 downto 0)
   );

end gmii_to_sgmii_rx_elastic_buffer;



architecture structural of gmii_to_sgmii_rx_elastic_buffer is



   -----------------------------------------------------------------------------
   -- Component declaration for the synchronisation flip-flop pair
   -----------------------------------------------------------------------------
   component gmii_to_sgmii_sync_block
   port (
      clk                        : in  std_logic;    -- clock to be sync'ed to
      data_in                    : in  std_logic;    -- Data to be 'synced'
      data_out                   : out std_logic     -- synced data
   );
   end component;



   -----------------------------------------------------------------------------
   -- Functions
   -----------------------------------------------------------------------------

   -- Convert a binary value into a gray code
   function bin_to_gray (
      bin : std_logic_vector)
      return std_logic_vector is

      variable gray : std_logic_vector(bin'range);

   begin

      for i in bin'range loop
         if i = bin'left then
            gray(i) := bin(i);
         else
            gray(i) := bin(i+1) xor bin(i);
         end if;
      end loop;  -- i

      return gray;

   end bin_to_gray;



   -- Convert a gray code value into binary
   function gray_to_bin (
      gray : std_logic_vector)
      return std_logic_vector is

      variable binary : std_logic_vector(gray'range);

   begin

      for i in gray'high downto gray'low loop
         if i = gray'high then
            binary(i) := gray(i);
         else
            binary(i) := binary(i+1) xor gray(i);
         end if;
      end loop;  -- i

      return binary;

   end gray_to_bin;



   -----------------------------------------------------------------------------
   -- Constants to set FIFO thresholds
   -----------------------------------------------------------------------------

   -- Upper and Lower thresholds to control clock correction
   constant upper_threshold     : unsigned := "100001";                 -- FIFO occupancy is over this level: clock correction should remove Idles.
   constant lower_threshold     : unsigned := "011111";                 -- FIFO occupancy is less than this level: clock correction should insert Idles.

   -- Underflow and Overflow thresholds to control buffer error
   constant underflow_threshold : unsigned := "000011";                 -- FIFO occupancy is less than this, we consider it to be an underflow.
   constant overflow_threshold  : unsigned := "111100";                 -- FIFO occupancy is greater than this, we consider it to be an overflow.

   -- Underflow and Overflow thresholds for C1,C2 insertion/deletion
   constant config_underflow_threshold : unsigned := "001111";                 -- FIFO occupancy is less than this, we consider it to be an underflow.
   constant config_overflow_threshold  : unsigned := "110000";                 -- FIFO occupancy is greater than this, we consider it to be an overflow.

   -----------------------------------------------------------------------------
   -- Signal Declarations
   -----------------------------------------------------------------------------

   -- Write domain logic (RXRECCLK)

   signal wr_data               : std_logic_vector(35 downto 0);        -- Formatted the data word from tranceiver signals.
   signal wr_data_reg           : std_logic_vector(35 downto 0);        -- wr_data registered and formatting completed: to be written to the RAM.
   signal wr_addr_plus2         : unsigned(5 downto 0);                 -- Always ahead of the FIFO write address by 2.
   signal wr_addr_plus1         : unsigned(5 downto 0);                 -- Always ahead of the FIFO write address by 1.
   signal wr_addr               : unsigned(8 downto 0);                 -- FIFO write address.
   signal addrbwraddr           : std_logic_vector(15 downto 0);        -- write address organised for RAM input
   signal wr_enable             : std_logic;                            -- write enable for FIFO.
   signal wr_addr_gray          : std_logic_vector(5 downto 0);         -- wr_addr is converted to a gray code.

   signal wr_rd_addr_gray       : std_logic_vector(5 downto 0);         -- read address pointer (gray coded) registered on write clock for the 2nd time.
   signal wr_rd_addr            : unsigned(5 downto 0);                 -- wr_rd_addr_gray converted back to binary (on the write clock domain).
   signal wr_occupancy          : unsigned(5 downto 0);                 -- The occupancy of the FIFO in write clock domain.
   signal filling               : std_logic;                            -- FIFO is filling up: Idles should be removed.

   signal k28p5_wr              : std_logic;                            -- /K28.5/ character is detected on data prior to FIFO.
   signal d16p2_wr              : std_logic;                            -- /D16.2/ character is detected on data prior to FIFO.
   signal d21p5_wr              : std_logic;                            -- /D21.5/ character is detected on data prior to FIFO.
   signal d2p2_wr               : std_logic;                            -- /D2.2/ character is detected on data prior to FIFO.
   signal k28p5_wr_reg          : std_logic;                            -- k28p5_wr registered.
   signal d16p2_wr_reg          : std_logic;                            -- d16p2_wr registered.
   signal d21p5_wr_reg          : std_logic;                            -- d21p5_wr registered.
   signal d2p2_wr_reg           : std_logic;                            -- d2p2_wr registered.
   signal d21p5_wr_reg2          : std_logic;                            -- d21p5_wr registered.
   signal d2p2_wr_reg2           : std_logic;                            -- d2p2_wr registered.
   signal k28p5_wr_reg2          : std_logic;                            -- k28p5_wr registered.
   signal remove_idle           : std_logic;                            -- An Idle is removed before writing it into the FIFO.
   signal remove_idle_reg1           : std_logic;                            -- An Idle is removed before writing it into the FIFO.
   signal remove_idle_reg2           : std_logic;                            -- An Idle is removed before writing it into the FIFO.
   signal start                         : std_logic := '1';             -- Initial stage
   signal reset_modified                : std_logic := '0';             -- Modified reset sequence
   signal initialize_ram                : std_logic;                    -- Start of ram Indication
   signal initialize_counter            : unsigned (4 downto 0) ;
   signal initialize_ram_complete       : std_logic;                    -- Indication that the ram has been initialized with zeros
   signal initialize_ram_complete_pulse : std_logic;                    -- Indication that the ram has been initialized with zeros
   signal initialize_ram_complete_reg   : std_logic;                    -- Indication that the ram has been initialized with zeros


   -- Read domain logic (RXUSRCLK2)

   signal rd_data_ram           : std_logic_vector(35 downto 0);        -- Date read out of the RAM (before registering).
   signal rd_data               : std_logic_vector(35 downto 0);        -- Date read out of the RAM.
   signal rd_data_reg           : std_logic_vector(35 downto 0);        -- rd_data is registered for logic pipeline.
   signal rd_addr_plus2         : unsigned(5 downto 0);                 -- Always ahead of the FIFO read address by 2.
   signal rd_addr_plus1         : unsigned(5 downto 0);                 -- Always ahead of the FIFO read address by 1.
   signal rd_addr               : unsigned(8 downto 0);                 -- FIFO read address.
   signal addrardaddr           : std_logic_vector(15 downto 0);        -- read address organised for RAM input
   signal rd_enable             : std_logic;                            -- read enable for FIFO.
   signal rd_addr_gray          : std_logic_vector(5 downto 0);         -- rd_addr is converted to a gray code.

   signal rd_wr_addr_gray       : std_logic_vector(5 downto 0);         -- write address pointer (gray coded) registered on read clock for the 2nd time.
   signal rd_wr_addr            : unsigned(5 downto 0);                 -- rd_wr_addr_gray converted back to binary (on the read clock domain).
   signal rd_occupancy          : unsigned(5 downto 0);                 -- The occupancy of the FIFO in read clock domain.
   signal emptying              : std_logic;                            -- FIFO is emptying: Idles should be inserted.
   signal overflow              : std_logic;                            -- FIFO has filled up to overflow.
   signal underflow             : std_logic;                            -- FIFO has emptied to underflow
   signal config_overflow              : std_logic;                            -- FIFO has filled up to overflow.
   signal config_underflow             : std_logic;                            -- FIFO has emptied to underflow

   signal even                  : std_logic;                            -- To control reading of data from upper or lower half of FIFO word.
   signal k28p5_rd              : std_logic;                            -- /K28.5/ character is detected on data post FIFO.
   signal d16p2_rd              : std_logic;                            -- /D16.2/ character is detected on data post FIFO.
   signal d21p5_rd              : std_logic;                            -- /D21.5/ character is detected on data post FIFO.
   signal d2p2_rd               : std_logic;                            -- /D2.2/ character is detected on data post FIFO.
   signal insert_idle           : std_logic;                            -- An Idle is inserted whilst reading it out of the FIFO.
   signal insert_idle_reg       : std_logic;                            -- insert_idle is registered.
   signal rxclkcorcnt           : std_logic_vector(2 downto 0);         -- derive RXCLKCORCNT to mimic tranceiver behaviour.

   signal initialize_ram_complete_sync         : std_logic;             -- Indication that the ram has been initialized with zeros
   signal initialize_ram_complete_sync_reg1    : std_logic;             -- Indication that the ram has been initialized with zeros
   signal initialize_ram_complete_sync_ris_edg : std_logic := '0';      -- Indication that the ram has been initialized with zeros

   -- Ram inference
   type ram_type is array (63 downto 0) of std_logic_vector (35 downto 0);
   signal ram : ram_type;
   signal spo                   : std_logic_vector(35 downto 0);       -- Date read out of the RAM (before registering).
   signal dpo                   : std_logic_vector(35 downto 0);       -- Date read out of the RAM (before registering).

   attribute ram_style: string;
   attribute ram_style of ram: signal is "distributed";
begin



  ------------------------------------------------------------------------------
  -- FIFO write logic (Idles are removed as necessary).
  ------------------------------------------------------------------------------



  -- Reclock the tranceiver data and format for storing in the RAM.
  gen_wr_data: process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1' or initialize_ram_complete = '0' then
        wr_data     <= (others => '0');
        wr_data_reg <= (others => '0');

      else
        wr_data_reg(35 downto 14) <= wr_data(35 downto 14);
        wr_data_reg(13)           <= remove_idle;
        wr_data_reg(12 downto 0)  <= wr_data(12 downto 0);

        -- unused parity bits
        wr_data(35 downto 32) <= "0000";

        -- format the upper word
        wr_data(31 downto 29) <= "000"; -- unused
        wr_data(28)           <= rxchariscomma_rec(0);
        wr_data(27)           <= rxcharisk_rec(0);
        wr_data(26)           <= rxdisperr_rec(0);
        wr_data(25)           <= rxnotintable_rec(0);
        wr_data(24)           <= rxrundisp_rec(0);
        wr_data(23 downto 16) <= rxdata_rec(7 downto 0);

        -- format the lower word
        wr_data(15 downto 13) <= "000"; -- unused
        wr_data(12)           <= rxchariscomma_rec(1);
        wr_data(11)           <= rxcharisk_rec(1);
        wr_data(10)           <= rxdisperr_rec(1);
        wr_data(9)            <= rxnotintable_rec(1);
        wr_data(8)            <= rxrundisp_rec(1);
        wr_data(7 downto 0)   <= rxdata_rec(15 downto 8);
    end if;
  end if;
  end process gen_wr_data;



  -- Detect /K28.5/ character in upper half of the word from tranceiver
  k28p5_wr <= '1' when (wr_data(23 downto 16) = "10111100"
                  and wr_data(27) = '1') else '0';

  -- Detect /D16.2/ character in upper half of the word from tranceiver
  d16p2_wr <= '1' when (wr_data(7 downto 0)   = "01010000"
                  and wr_data(11) = '0') else '0';

  -- Detect /D21.5/ character in upper half of the word from tranceiver
  d21p5_wr <= '1' when (wr_data(7 downto 0)   = "10110101"
                  and wr_data(11) = '0') else '0';

  -- Detect /D2.2/ character in upper half of the word from tranceiver
  d2p2_wr <= '1' when (wr_data(7 downto 0)   = "01000010"
                  and wr_data(11) = '0') else '0';


  -- Create the FIFO write enable: Idles are removed by deasserting the
  -- FIFO write_enable whilst an Idle is present on the data.
  gen_wr_enable: process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1' then
        wr_enable      <= '0';
        remove_idle    <= '0';
        remove_idle_reg1    <= '0';
        remove_idle_reg2    <= '0';
        k28p5_wr_reg   <= '0';
        k28p5_wr_reg2   <= '0';
        d16p2_wr_reg   <= '0';
        d21p5_wr_reg   <= '0';
        d2p2_wr_reg    <= '0';
        d21p5_wr_reg2   <= '0';
        d2p2_wr_reg2    <= '0';
      else
        k28p5_wr_reg   <= k28p5_wr;
        k28p5_wr_reg2   <= k28p5_wr_reg;
        d16p2_wr_reg   <= d16p2_wr;
        d21p5_wr_reg   <= d21p5_wr;
        d2p2_wr_reg    <= d2p2_wr;
        d21p5_wr_reg2   <= d21p5_wr_reg;
        d2p2_wr_reg2    <= d2p2_wr_reg;
        remove_idle_reg1    <= remove_idle;
        remove_idle_reg2    <= remove_idle_reg1;

        -- Idle removal (always leave the first /I2/ Idle, then every
        -- alternate Idle can be removed.
	if (initialize_ram_complete = '0') then
            wr_enable   <= '1';
        else
        if ( (k28p5_wr = '1' and d16p2_wr = '1' and k28p5_wr_reg = '1' and d16p2_wr_reg = '1' and filling = '1' and remove_idle = '0') or 
              (((k28p5_wr = '1' and d21p5_wr = '1' and k28p5_wr_reg2 = '1' and (d21p5_wr_reg2 = '1' or d2p2_wr_reg2 = '1')) or 
               (k28p5_wr = '1' and d2p2_wr = '1' and k28p5_wr_reg2 = '1' and (d2p2_wr_reg2 = '1' or d21p5_wr_reg2 =  '1'))) and
                config_overflow = '1' and remove_idle = '0' and remove_idle_reg1 = '0' and remove_idle_reg2 = '0'))  then

               wr_enable   <= '0';
               remove_idle <= '1';

            -- Else write new word on every clock edge.
            else
               wr_enable   <= '1';
               remove_idle <= '0';
	    end if;
        end if;
      end if;
    end if;
  end process gen_wr_enable;



  -- Create the FIFO write address pointer.  Note that wr_addr_plus2
  -- will be converted to gray code and passed across the async clock
  -- boundary.
  gen_wr_addr: process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1' then
        wr_addr_plus2         <= "000010";
        wr_addr_plus1         <= "000001";
        wr_addr(5 downto 0)   <= "000000";
      elsif initialize_ram_complete_pulse = '1' then
        wr_addr_plus2         <= "100010";
        wr_addr_plus1         <= "100001";
        wr_addr(5 downto 0)   <= "100000";
      else
        if wr_enable = '1' then
          wr_addr_plus2       <= wr_addr_plus2 + 1;
          wr_addr_plus1       <= wr_addr_plus2;
          wr_addr(5 downto 0) <= wr_addr_plus1;
      end if;
    end if;
  end if;
  end process gen_wr_addr;

  -- Not all of the RAM memory is required
  wr_addr(8 downto 6) <= "000";



  -- Convert look-ahead write address pointer into a gray code
  wr_addrgray_bits: process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1' then
        wr_addr_gray <= "110001";
      else
        wr_addr_gray <= bin_to_gray(std_logic_vector(
                                    wr_addr_plus2(5 downto 0)));
    end if;
  end if;
  end process wr_addrgray_bits;


  ------------------------------------------------------------------------------
  -- Logic to initialize the lower half of buffer with zeros. 
  -- This prevents wrong link up due to residual idles in the buffer.
  ------------------------------------------------------------------------------
  init_wr_logic : process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1' or start = '1' then
         initialize_ram <= '1';
      elsif initialize_ram_complete = '1' then
         initialize_ram <= '0';
      end if;
    end if;
  end process init_wr_logic;

  init_counter_logic : process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1'  or start = '1'  then
          initialize_counter <= "00000";
      elsif initialize_ram = '1' and (initialize_counter /= "11111") then
	  initialize_counter <= initialize_counter + 1;
      end if;
    end if;
  end process init_counter_logic;
    
  init_complete_logic : process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      start <= '0';
      if rxrecreset = '1'  or start = '1'  then
          initialize_ram_complete <= '0';
      elsif (initialize_counter = "11111") then
	  initialize_ram_complete <= '1';
      end if;

      if rxrecreset = '1'  or start = '1'  then
          initialize_ram_complete_reg   <= '0';
          initialize_ram_complete_pulse <= '0';
      else
          initialize_ram_complete_reg <= initialize_ram_complete;
	  if (initialize_ram_complete = '1' and initialize_ram_complete_reg = '0') then
	      initialize_ram_complete_pulse <= '1';
          else
	      initialize_ram_complete_pulse <= '0';
          end if;
      end if;
    end if;
  end process init_complete_logic;
     
  ------------------------------------------------------------------------------
  -- Infer a dual port RAM
  ------------------------------------------------------------------------------

   write_data_ram: process (rxrecclk)
   begin
     if rxrecclk'event and rxrecclk = '1' then
        if wr_enable = '1' then
          ram(to_integer(wr_addr)) <=  wr_data_reg;
        end if;
     end if;
   end process write_data_ram;

   spo <= ram(to_integer(wr_addr));
   dpo <= ram(to_integer(rd_addr));

  ------------------------------------------------------------------------------
  -- FIFO read logic (Idles are insterted as necessary).
  ------------------------------------------------------------------------------


  -- Register the distributed RAM read data.
  reg_rd_data_ram: process (rxusrclk2)
  begin
     if rxusrclk2'event and rxusrclk2 = '1' then
           if reset_modified = '1' then
              rd_data <= (others => '0');
           else
              rd_data <= dpo;
    end if;
       end if;
  end process reg_rd_data_ram;


  ------------------------------------------------------------------------------
  -- FIFO read logic (Idles are insterted as necessary).
  ------------------------------------------------------------------------------



  -- Register the RAM data.
  reg_rd_data: process (rxusrclk2)
  begin
     if rxusrclk2'event and rxusrclk2 = '1' then
        if reset_modified = '1' then
           rd_data_reg   <= (others => '0');
        elsif rd_enable = '1' then
           rd_data_reg   <= rd_data;
        end if;
    end if;
  end process reg_rd_data;



  -- Detect /K28.5/ character in upper half of the word read from FIFO
  k28p5_rd <= '1' when (rd_data(23 downto 16) = "10111100"
                  and rd_data(27) = '1') else '0';

  -- Detect /D16.2/ character in lower half of the word read from FIFO
  d16p2_rd <= '1' when (rd_data(7 downto 0) = "01010000"
                  and rd_data(11) = '0') else '0';

  -- Detect /D21.5/ character in lower half of the word read from FIFO
  d21p5_rd <= '1' when (rd_data(7 downto 0) = "10110101"
                  and rd_data(11) = '0') else '0';

  -- Detect /D2.2/ character in lower half of the word read from FIFO
  d2p2_rd <= '1' when (rd_data(7 downto 0) = "01000010"
                  and rd_data(11) = '0') else '0';



  -- Create the FIFO read enable: Idles are inserted by pausing the
  -- FIFO read_enable whilst an Idle is present on the data.
  gen_rd_enable: process (rxusrclk2)
  begin
    if rxusrclk2'event and rxusrclk2 = '1' then
      if reset_modified = '1' then
        even            <= '1';
        rd_enable       <= '0';
        insert_idle     <= '0';
        insert_idle_reg <= '0';
      else
        even            <= (not even);
        insert_idle_reg <= insert_idle;

        -- Repeat as many /I2/ code groups as required if nearly
        -- empty by pausing rd_enable.
        if ((k28p5_rd = '1' and d16p2_rd = '1' and emptying = '1') or (k28p5_rd = '1' and (d21p5_rd = '1' or d2p2_rd = '1') and config_underflow = '1')) then
           rd_enable    <= '0';
           insert_idle  <= even;

        -- Else read out a new word on every alternative clock edge.
        else
           rd_enable    <= even;
           insert_idle  <= '0';
      end if;
    end if;
  end if;
  end process gen_rd_enable;



  -- Create the FIFO read address pointer.  Note that rd_addr_plus2
  -- will be converted to gray code and passed across the async clock
  -- boundary.
  gen_rd_addr: process (rxusrclk2)
  begin
     if rxusrclk2'event and rxusrclk2 = '1' then
        if reset_modified = '1' then
           rd_addr_plus2       <= "000010";
           rd_addr_plus1       <= "000001";
           rd_addr(5 downto 0) <= "000000";

        elsif rd_enable = '1' then
           rd_addr_plus2       <= rd_addr_plus2 + 1;
           rd_addr_plus1       <= rd_addr_plus2;
           rd_addr(5 downto 0) <= rd_addr_plus1;
        end if;
    end if;
  end process gen_rd_addr;

  -- Not all of the RAM memory is required
  rd_addr(8 downto 6) <= "000";



  -- Convert look-ahead read address pointer into a gray code
  rd_addrgray_bits: process (rxusrclk2)
  begin
      if rxusrclk2'event and rxusrclk2 = '1' then
        if reset_modified = '1' then
           rd_addr_gray <= (others => '0');
        else
           rd_addr_gray <= bin_to_gray(std_logic_vector(
                                       rd_addr_plus2(5 downto 0)));
       end if;
    end if;
  end process rd_addrgray_bits;



  -- Multiplex the double width FIFO words to single words.
  gen_mux: process (rxusrclk2)
  begin
    if rxusrclk2'event and rxusrclk2 = '1' then
      if reset_modified = '1' then
        rxchariscomma_usr   <= '0';
        rxcharisk_usr       <= '0';
        rxdisperr_usr       <= '0';
        rxnotintable_usr    <= '0';
        rxrundisp_usr       <= '0';
        rxdata_usr          <= X"00";
      else
        if even = '1' then
          rxchariscomma_usr <= rd_data_reg(28);
          rxcharisk_usr     <= rd_data_reg(27);
          rxdisperr_usr     <= rd_data_reg(26);
          rxnotintable_usr  <= rd_data_reg(25);
          rxrundisp_usr     <= rd_data_reg(24);
          rxdata_usr        <= rd_data_reg(23 downto 16);
        else
          rxchariscomma_usr <= rd_data_reg(12);
          rxcharisk_usr     <= rd_data_reg(11);
          rxdisperr_usr     <= rd_data_reg(10);
          rxnotintable_usr  <= rd_data_reg(9);
          rxrundisp_usr     <= rd_data_reg(8);
          rxdata_usr        <= rd_data_reg(7 downto 0);
        end if;
      end if;
  end if;
  end process gen_mux;



  -- Create tranceiver style clock correction status when inserting /
  -- removing Idles.
  gen_rxclkcorcnt: process (rxusrclk2)
  begin
    if rxusrclk2'event and rxusrclk2 = '1' then
      if reset_modified = '1'  then
        rxclkcorcnt   <= "000";
      else
        if rd_data_reg(13) = '1' and rxclkcorcnt(0) = '0' then
           rxclkcorcnt   <= "001";
        elsif insert_idle_reg = '1' then
           rxclkcorcnt   <= "111";
        else
           rxclkcorcnt   <= "000";
        end if;
      end if;
  end if;
  end process gen_rxclkcorcnt;

  rxclkcorcnt_usr <= rxclkcorcnt;



  ------------------------------------------------------------------------------
  -- Create emptying/full thresholds in read clock domain.
  ------------------------------------------------------------------------------



  -- Reclock the write address pointer (gray code) onto the read domain.
  -- By reclocking the gray code, the worst case senario is that
  -- the reclocked value is only in error by -1, since only 1 bit at a
  -- time changes between gray code increments.
  reclock_wr_addrgray:
  for j in 5 downto 0 generate
  
     sync_wr_addrgray: gmii_to_sgmii_sync_block
     port map (
        clk       => rxusrclk2,
        data_in   => wr_addr_gray(j),
        data_out  => rd_wr_addr_gray(j)
     );
  end generate;


  -- Syncing initialize_ram_complete
  sync_initialize_ram_comp: gmii_to_sgmii_sync_block
  port map (
     clk       => rxusrclk2,
     data_in   => initialize_ram_complete,
     data_out  => initialize_ram_complete_sync
  );

  --Determine the occupancy of the FIFO as observed in the read domain.
  reset_seq : process (rxusrclk2)
  begin
     if rxusrclk2'event and rxusrclk2 = '1' then
        initialize_ram_complete_sync_reg1     <= initialize_ram_complete_sync;
	if ( initialize_ram_complete_sync = '1' and initialize_ram_complete_sync_reg1 = '0' ) then
           initialize_ram_complete_sync_ris_edg  <=  '1';
        else 
           initialize_ram_complete_sync_ris_edg  <=  '0';
        end if;

	if ( rxreset = '1' and reset_modified = '0') then
           reset_modified <= '1';
        elsif (initialize_ram_complete_sync_ris_edg = '1') then
           reset_modified <= '0';
        end if;
     end if;
  end process reset_seq;


  -- Convert the resync'd Write Address Pointer grey code back to binary
  rd_wr_addr <=unsigned(gray_to_bin(std_logic_vector(rd_wr_addr_gray)));



  --Determine the occupancy of the FIFO as observed in the read domain.
  gen_rd_occupancy: process (rxusrclk2)
  begin
     if rxusrclk2'event and rxusrclk2 = '1' then
        if reset_modified = '1' then
           rd_occupancy <= "100000";
        else
           rd_occupancy <= rd_wr_addr - rd_addr(5 downto 0);
        end if;
     end if;
  end process gen_rd_occupancy;



  -- Set emptying flag if FIFO occupancy is less than LOWER_THRESHOLD.
  gen_emptying : process (rd_occupancy)
  begin
     if rd_occupancy < lower_threshold then
        emptying <= '1';
     else
        emptying <= '0';
     end if;
  end process gen_emptying;



  -- Set underflow if FIFO occupancy is less than UNDERFLOW_THRESHOLD.
  gen_underflow : process (rd_occupancy)
  begin
     if rd_occupancy < underflow_threshold then
        underflow <= '1';
     else
        underflow <= '0';
     end if;
  end process gen_underflow;



  -- Set overflow if FIFO occupancy is less than OVERFLOW_THRESHOLD.
  gen_overflow : process (rd_occupancy)
  begin
     if rd_occupancy > overflow_threshold then
        overflow <= '1';
     else
        overflow <= '0';
     end if;
  end process gen_overflow;

  -- Set underflow if FIFO occupancy is less than UNDERFLOW_THRESHOLD.
  gen_config_underflow : process (rd_occupancy)
  begin
     if rd_occupancy < config_underflow_threshold then
        config_underflow <= '1';
     else
        config_underflow <= '0';
     end if;
  end process gen_config_underflow;


  -- If either an underflow or overflow, assert the buffer error signal.
  -- Like the tranceiver, this will persist until a reset is issued.
  gen_buffer_error : process (rxusrclk2)
  begin
     if rxusrclk2'event and rxusrclk2 = '1' then
        if reset_modified = '1' then
           rxbuferr <= '0';
        elsif (overflow or underflow) = '1' then
           rxbuferr <= '1';
        end if;
     end if;
  end process gen_buffer_error;



  ------------------------------------------------------------------------------
  -- Create emptying/full thresholds in write clock domain.
  ------------------------------------------------------------------------------



  -- Reclock the read address pointer (gray code) onto the write domain.
  -- By reclocking the gray code, the worst case senario is that
  -- the reclocked value is only in error by -1, since only 1 bit at a
  -- time changes between gray code increments.
  reclock_rd_addrgray:
  for k in 5 downto 0 generate
  
     sync_rd_addrgray: gmii_to_sgmii_sync_block
     port map (
        clk       => rxrecclk,
        data_in   => rd_addr_gray(k),
        data_out  => wr_rd_addr_gray(k)
     );
  end generate;



  -- Convert the resync'd Read Address Pointer grey code back to binary
  wr_rd_addr <=unsigned(gray_to_bin(std_logic_vector(wr_rd_addr_gray)));



  --Determine the occupancy of the FIFO as observed in the write domain.
  gen_wr_occupancy: process (rxrecclk)
  begin
    if rxrecclk'event and rxrecclk = '1' then
      if rxrecreset = '1' or initialize_ram_complete = '0' then
        wr_occupancy <= "100000";
      else
        wr_occupancy <= wr_addr(5 downto 0) - wr_rd_addr;
      end if;
    end if;
  end process gen_wr_occupancy;



  -- Set filling flag if FIFO occupancy is greated than UPPER_THRESHOLD.
  gen_filling : process (wr_occupancy)
  begin
     if wr_occupancy > upper_threshold then
        filling <= '1';
     else
        filling <= '0';
     end if;
  end process gen_filling;

  -- Set overflow if FIFO occupancy is less than OVERFLOW_THRESHOLD.
  gen_config_overflow : process (wr_occupancy)
  begin
     if wr_occupancy > config_overflow_threshold then
        config_overflow <= '1';
     else
        config_overflow <= '0';
     end if;
  end process gen_config_overflow;

end structural;

