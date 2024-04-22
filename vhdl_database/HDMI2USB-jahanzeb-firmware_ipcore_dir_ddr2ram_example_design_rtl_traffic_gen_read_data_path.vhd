--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: %version
--  \   \         Application: MIG
--  /   /         Filename: read_data_path.vhd
-- /___/   /\     Date Last Modified: $Date: 2011/05/27 15:50:28 $
-- \   \  /  \    Date Created: Jul 03 2009
--  \___\/\___\
--
-- Device: Spartan6
-- Design Name: DDR/DDR2/DDR3/LPDDR 
-- Purpose: This is top level of read path and also consist of comparison logic
--         for read data. 
-- Reference:
-- Revision History:

--*****************************************************************************

LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

entity read_data_path is
   generic (
      TCQ                            : time := 100 ps;      
      FAMILY                         : string := "VIRTEX6";
      MEM_BURST_LEN                  : integer := 8;
      ADDR_WIDTH                     : integer := 32;
      CMP_DATA_PIPE_STAGES           : integer := 3;
      DWIDTH                         : integer := 32;
      DATA_PATTERN                   : string := "DGEN_ALL";           --"DGEN__HAMMER", "DGEN_WALING1","DGEN_WALING0","DGEN_ADDR","DGEN_NEIGHBOR","DGEN_PRBS","DGEN_ALL"  
      NUM_DQ_PINS                    : integer := 8;
      DQ_ERROR_WIDTH                 : integer := 1;
      SEL_VICTIM_LINE                : integer := 3;            -- VICTIM LINE is one of the DQ pins is selected to be different than hammer pattern
      
      MEM_COL_WIDTH                  : integer := 10
   );
   port (
      
      clk_i                          : in std_logic;
      manual_clear_error             : in std_logic;
      rst_i                          : in std_logic_vector(9 downto 0);
      cmd_rdy_o                      : out std_logic;
      cmd_valid_i                    : in std_logic;
      prbs_fseed_i                   : in std_logic_vector(31 downto 0);
      
      data_mode_i                    : in std_logic_vector(3 downto 0);
      cmd_sent                       : in std_logic_vector(2 downto 0);
      bl_sent                        : in std_logic_vector(5 downto 0);
      cmd_en_i                       : in std_logic;
--      m_addr_i                       : in std_logic_vector(31 downto 0);
      fixed_data_i                   : in std_logic_vector(DWIDTH - 1 downto 0);
      
      addr_i                         : in std_logic_vector(31 downto 0);
      bl_i                           : in std_logic_vector(5 downto 0);
      --   input [5:0]            port_data_counts_i,// connect to data port fifo counts
      
      data_rdy_o                     : out std_logic;
      data_valid_i                   : in std_logic;
      data_i                         : in std_logic_vector(DWIDTH - 1 downto 0);
      last_word_rd_o                 : out std_logic;
      data_error_o                   : out std_logic;
      cmp_data_o                     : out std_logic_vector(DWIDTH - 1 downto 0);
      rd_mdata_o                     : out std_logic_vector(DWIDTH - 1 downto 0);
      cmp_data_valid                 : out std_logic;
      cmp_addr_o                     : out std_logic_vector(31 downto 0);
      cmp_bl_o                       : out std_logic_vector(5 downto 0);
      force_wrcmd_gen_o              : out std_logic;
      
      rd_buff_avail_o                : out std_logic_vector(6 downto 0);
      dq_error_bytelane_cmp          : out std_logic_vector(DQ_ERROR_WIDTH - 1 downto 0);
       cumlative_dq_lane_error_r     : out std_logic_vector(DQ_ERROR_WIDTH - 1 downto 0)

      
      
   );
end entity read_data_path;

architecture trans of read_data_path is

function REDUCTION_OR( A: in std_logic_vector) return std_logic is
  variable tmp : std_logic := '0';
begin
  for i in A'range loop
       tmp := tmp or A(i);
  end loop;
  return tmp;
end function REDUCTION_OR;

   COMPONENT read_posted_fifo IS
      GENERIC (
         TCQ                   : time   := 100 ps;
         MEM_BURST_LEN         : integer := 4;
         FAMILY                : STRING := "SPARTAN6";
         ADDR_WIDTH            : INTEGER := 32;
         BL_WIDTH              : INTEGER := 6
      );
      PORT (
         clk_i                 : IN STD_LOGIC;
         rst_i                 : IN STD_LOGIC;
         cmd_rdy_o             : OUT STD_LOGIC;
         cmd_valid_i           : IN STD_LOGIC;
         data_valid_i          : IN STD_LOGIC;
         addr_i                : IN STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
         bl_i                  : IN STD_LOGIC_VECTOR(BL_WIDTH - 1 DOWNTO 0);
         user_bl_cnt_is_1      : IN STD_LOGIC;
         cmd_sent              : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         bl_sent               : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
         cmd_en_i              : IN STD_LOGIC;
         gen_rdy_i             : IN STD_LOGIC;
         gen_valid_o           : OUT STD_LOGIC;
         gen_addr_o            : OUT STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
         gen_bl_o              : OUT STD_LOGIC_VECTOR(BL_WIDTH - 1 DOWNTO 0);
         rd_buff_avail_o       : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
         rd_mdata_fifo_empty   : IN STD_LOGIC;
         rd_mdata_en           : OUT STD_LOGIC   
      );
   END COMPONENT;

   component rd_data_gen is
      generic (
         FAMILY                         : string := "SPARTAN6";
         MEM_BURST_LEN                  : integer := 8;
         ADDR_WIDTH                     : integer := 32;
         BL_WIDTH                       : integer := 6;
         DWIDTH                         : integer := 32;
         DATA_PATTERN                   : string := "DGEN_PRBS";
         NUM_DQ_PINS                    : integer := 8;
         SEL_VICTIM_LINE                : integer := 3;
         COLUMN_WIDTH                   : integer := 10
      );
      port (
         clk_i                          : in std_logic;
         rst_i                          : in std_logic_vector(4 downto 0);
         prbs_fseed_i                   : in std_logic_vector(31 downto 0);
         rd_mdata_en                    : in std_logic;
         data_mode_i                    : in std_logic_vector(3 downto 0);
         cmd_rdy_o                      : out std_logic;
         cmd_valid_i                    : in std_logic;
         last_word_o                    : out std_logic;
--         m_addr_i                       : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
         fixed_data_i                   : in std_logic_vector(DWIDTH - 1 downto 0);  
         
         addr_i                         : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
         bl_i                           : in std_logic_vector(BL_WIDTH - 1 downto 0);
         user_bl_cnt_is_1_o             : out std_logic;
         data_rdy_i                     : in std_logic;
         data_valid_o                   : out std_logic;
         data_o                         : out std_logic_vector(DWIDTH - 1 downto 0)
      );
   end component;

   component afifo IS
   GENERIC (
      DSIZE       : INTEGER := 32;
      FIFO_DEPTH  : INTEGER := 16;
      ASIZE       : INTEGER := 5;
      SYNC        : INTEGER := 1
   );
   PORT (
      wr_clk      : IN STD_LOGIC;
      rst         : IN STD_LOGIC;
      wr_en       : IN STD_LOGIC;
      wr_data     : IN STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);
      rd_en       : IN STD_LOGIC;
      rd_clk      : IN STD_LOGIC;
      rd_data     : OUT STD_LOGIC_VECTOR(DSIZE - 1 DOWNTO 0);
      almost_full : OUT STD_LOGIC;
      full        : OUT STD_LOGIC;
      empty       : OUT STD_LOGIC
   );
END component;
   
   signal gen_rdy                  : std_logic;
   signal gen_valid                : std_logic;
   signal gen_addr                 : std_logic_vector(31 downto 0);
   signal gen_bl                   : std_logic_vector(5 downto 0);
   
   signal cmp_rdy                  : std_logic;
   signal cmp_valid                : std_logic;
   signal cmp_addr                 : std_logic_vector(31 downto 0);
   signal cmp_bl                   : std_logic_vector(5 downto 0);
   
   signal data_error               : std_logic;
   signal cmp_data                 : std_logic_vector(DWIDTH - 1 downto 0);
   signal last_word_rd             : std_logic;
   signal bl_counter               : std_logic_vector(5 downto 0);
   signal cmd_rdy                  : std_logic;
   signal user_bl_cnt_is_1         : std_logic;
   signal data_rdy                 : std_logic;
   signal delayed_data             : std_logic_vector(DWIDTH downto 0);
--   signal cmp_data_piped           : std_logic_vector(DWIDTH downto 0);
   signal cmp_data_r               : std_logic_vector(DWIDTH-1 downto 0);    
   signal rd_mdata_en              : std_logic;   
   signal rd_data_r                : std_logic_vector(DWIDTH - 1 downto 0);
   signal force_wrcmd_gen          : std_logic;
   signal wait_bl_end              : std_logic;
   signal wait_bl_end_r1           : std_logic;

   signal v6_data_cmp_valid        : std_logic;
   signal rd_v6_mdata              : std_logic_vector(DWIDTH-1 downto 0);    
   signal cmpdata_r                : std_logic_vector(DWIDTH-1 downto 0);    
   signal rd_mdata                 : std_logic_vector(DWIDTH-1 downto 0);    
   signal l_data_error             : std_logic;
   signal u_data_error             : std_logic;
   signal cmp_data_en              : std_logic;
   
   signal force_wrcmd_timeout_cnts : std_logic_vector(7 downto 0);

   signal error_byte               : std_logic_vector(NUM_DQ_PINS / 2 - 1 downto 0);
   signal error_byte_r1             : std_logic_vector(NUM_DQ_PINS / 2 - 1 downto 0);
   signal dq_lane_error            : std_logic_vector(DQ_ERROR_WIDTH-1 downto 0); 
   signal dq_lane_error_r1         : std_logic_vector(DQ_ERROR_WIDTH-1 downto 0); 
   signal dq_lane_error_r2         : std_logic_vector(DQ_ERROR_WIDTH-1 downto 0); 
   signal cum_dq_lane_error_mask   : std_logic_vector(DQ_ERROR_WIDTH-1 downto 0); 
   signal cumlative_dq_lane_error_reg  : std_logic_vector(DQ_ERROR_WIDTH-1 downto 0); 
   signal cumlative_dq_lane_error_c     : std_logic_vector(DQ_ERROR_WIDTH - 1 downto 0);
  signal  rd_mdata_fifo_empty      : std_logic;
   signal data_valid_r             : std_logic;
   -- Declare intermediate signals for referenced outputs
--   SIGNAL xhdl2 : STD_LOGIC_VECTOR(DWIDTH DOWNTO 0);
--   SIGNAL tmp_sig : STD_LOGIC;
   signal last_word_rd_o_xhdl0     : std_logic;
   signal rd_buff_avail_o_xhdl1    : std_logic_vector(6 downto 0);
begin
   -- Drive referenced outputs
   last_word_rd_o <= last_word_rd_o_xhdl0;
   rd_buff_avail_o <= rd_buff_avail_o_xhdl1;

   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         wait_bl_end_r1 <= wait_bl_end;
         rd_data_r <= data_i;
      end if;
   end process;
   
   force_wrcmd_gen_o <= force_wrcmd_gen;
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i(0) = '1') then
            force_wrcmd_gen <= '0';
         elsif ((wait_bl_end = '0' and wait_bl_end_r1 = '1') or force_wrcmd_timeout_cnts = "11111111") then
            force_wrcmd_gen <= '0';
         elsif ((cmd_valid_i = '1' and bl_i > "010000") or wait_bl_end = '1') then
            force_wrcmd_gen <= '1';
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i(0) = '1') then
            force_wrcmd_timeout_cnts <= "00000000";
         elsif (wait_bl_end = '0' and wait_bl_end_r1 = '1') then
            force_wrcmd_timeout_cnts <= "00000000";
         elsif (force_wrcmd_gen = '1') then
            force_wrcmd_timeout_cnts <= force_wrcmd_timeout_cnts + "00000001";
         end if;
      end if;
   end process;
   
   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         if (rst_i(0) = '1') then
            wait_bl_end <= '0';
         elsif (force_wrcmd_timeout_cnts = "11111111") then
            wait_bl_end <= '0';
         elsif ((gen_rdy and gen_valid) = '1' and gen_bl > "010000") then
            wait_bl_end <= '1';
         elsif ((wait_bl_end and user_bl_cnt_is_1) = '1') then
            wait_bl_end <= '0';
         end if;
      end if;
   end process;
   
   cmd_rdy_o <= cmd_rdy;
   
   
   read_postedfifo : read_posted_fifo
      GENERIC MAP (
         TCQ         => TCQ,
         FAMILY      => FAMILY,
         MEM_BURST_LEN => MEM_BURST_LEN,
         ADDR_WIDTH  => 32,
         BL_WIDTH    => 6
      )
      port map (
         clk_i             => clk_i,
         rst_i             => rst_i(0),
         cmd_rdy_o         => cmd_rdy,
         cmd_valid_i       => cmd_valid_i,
         data_valid_i      => data_rdy,
         addr_i            => addr_i,
         bl_i              => bl_i,
         cmd_sent          => cmd_sent,
         bl_sent           => bl_sent,
         cmd_en_i          => cmd_en_i,
         user_bl_cnt_is_1  => user_bl_cnt_is_1,
         gen_rdy_i         => gen_rdy,
         gen_valid_o       => gen_valid,
         gen_addr_o        => gen_addr,
         gen_bl_o          => gen_bl,
         rd_buff_avail_o   => rd_buff_avail_o_xhdl1,
         rd_mdata_fifo_empty => rd_mdata_fifo_empty,
         rd_mdata_en       => rd_mdata_en
      );
   
   
   rd_datagen : rd_data_gen
      generic map (
         FAMILY           => FAMILY,
         MEM_BURST_LEN    => MEM_BURST_LEN,
         NUM_DQ_PINS      => NUM_DQ_PINS,
         SEL_VICTIM_LINE  => SEL_VICTIM_LINE,
         DATA_PATTERN     => DATA_PATTERN,
         DWIDTH           => DWIDTH,
         COLUMN_WIDTH     => MEM_COL_WIDTH
      )
      port map (
         clk_i               => clk_i,
         rst_i               => rst_i(4 downto 0),
         prbs_fseed_i        => prbs_fseed_i,
         data_mode_i         => data_mode_i,
         cmd_rdy_o           => gen_rdy,
         cmd_valid_i         => gen_valid,
         last_word_o         => last_word_rd_o_xhdl0,
--         m_addr_i            => m_addr_i,
         fixed_data_i        => fixed_data_i,
         addr_i              => gen_addr,
         bl_i                => gen_bl,
         user_bl_cnt_is_1_o  => user_bl_cnt_is_1,
         data_rdy_i          => data_valid_i,
         data_valid_o        => cmp_valid,
         data_o              => cmp_data,
         rd_mdata_en         => rd_mdata_en
      );

      rd_mdata_fifo : afifo
         GENERIC MAP (
            DSIZE       => DWIDTH,
            FIFO_DEPTH  => 32,
            ASIZE       => 5,
            SYNC        => 1
         )
         PORT MAP (
            wr_clk   => clk_i,
            rst      => rst_i(0),
            wr_en    => data_valid_i,
            wr_data  => data_i,
            rd_en    => rd_mdata_en,
            rd_clk   => clk_i,
            rd_data  => rd_v6_mdata,
            full     => open,
            empty    => rd_mdata_fifo_empty,
            almost_full => open
         );
  
--  tmp_sig <= cmp_valid AND data_valid_i; 
--   xhdl2 <= ( tmp_sig & cmp_data);
 
  process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
--         delayed_data <= (tmp_sig & cmp_data);
         cmp_data_r <= cmp_data;
      end if;
   end process;
   
   rd_mdata_o <= rd_mdata;

   rd_mdata <= rd_data_r WHEN (FAMILY = "SPARTAN6") ELSE rd_v6_mdata 
               WHEN ((FAMILY = "VIRTEX6") and (MEM_BURST_LEN = 4)) ELSE data_i;

   cmp_data_valid <= cmp_data_en WHEN (FAMILY = "SPARTAN6") ELSE v6_data_cmp_valid 
               WHEN ((FAMILY = "VIRTEX6") and (MEM_BURST_LEN = 4)) ELSE data_valid_i;


   cmp_data_o <= cmp_data_r;
   cmp_addr_o <= gen_addr;
   cmp_bl_o <= gen_bl;

--   xhdl4 : if (FAMILY = "SPARTAN6") generate
--      rd_data_o <= rd_data_r;
--   end generate;
--   xhdl5 : if (FAMILY /= "SPARTAN6") generate
--      rd_data_o <= data_i;
--   end generate;

   data_rdy_o <= data_rdy;
   data_rdy <= cmp_valid and data_valid_i;

   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         v6_data_cmp_valid <= rd_mdata_en;
      end if;
   end process;
    

   process (clk_i)
   begin
      if (clk_i'event and clk_i = '1') then
         cmp_data_en <= data_rdy;
      end if;
   end process;
   
   xhdl6 : if (FAMILY = "SPARTAN6") generate
      process (clk_i)
      begin
         if (clk_i'event and clk_i = '1') then
            if (cmp_data_en = '1') then
              IF ((rd_data_r(DWIDTH / 2 - 1 downto 0) /= cmp_data_r(DWIDTH / 2 - 1 downto 0))) then
                l_data_error <= '1' ;
              ELSE 
                l_data_error <= '0' ;
              END IF; 
            else
               l_data_error <= '0' ;
            end if;
            if (cmp_data_en = '1') then
              IF ((rd_data_r(DWIDTH - 1 downto DWIDTH / 2) /= cmp_data_r(DWIDTH - 1 downto DWIDTH / 2))) then
                u_data_error <= '1' ;
              ELSE
                u_data_error <= '0' ;
              END IF;
            else
               u_data_error <= '0' ;
            end if;
            data_error <= l_data_error or u_data_error;
            --synthesis translate_off
            if (data_error = '1') then
              report ("DATA ERROR");
            end if;
            --synthesis translate_on

         end if;
      end process;
      
   end generate;
   
   gen_error_2 : if ((FAMILY = "VIRTEX6") and (MEM_BURST_LEN = 4)) generate
      
      
      gen_cmp : FOR i IN 0 TO  NUM_DQ_PINS / 2 - 1 GENERATE
         error_byte(i) <= '1' WHEN (rd_mdata_fifo_empty = '0' AND rd_mdata_en = '1' AND (rd_v6_mdata(8 * (i + 1) - 1 DOWNTO 8 * i) /= cmp_data(8 * (i + 1) - 1 DOWNTO 8 * i))) ELSE '0';
         
      end generate;
      process (clk_i)
      begin
         if (clk_i'event and clk_i = '1') then
             IF (rst_i(1) = '1' or manual_clear_error = '1') THEN
                 error_byte_r1 <= (others => '0');
                 data_error    <= '0';
             ELSE
             
              error_byte_r1 <= error_byte;
           -- FOR i IN 0 TO  DWIDTH - 1 LOOP
              data_error <= REDUCTION_OR(error_byte_r1);--error_byte_r1(i) OR data_error;
           -- END LOOP;
        
            
            END IF;
         end if;
      end process;
      

      process (data_error)
      begin
         
         --synthesis translate_off   
            IF (data_error = '1') THEN               
               
               report "DATA ERROR"; -- severity ERROR;
            END IF;
         --synthesis translate_on
      end process;
      
      
      gen_dq_error_map: FOR i IN 0 to DQ_ERROR_WIDTH - 1 generate
         dq_lane_error(i) <= (error_byte_r1(i) OR error_byte_r1(i+DQ_ERROR_WIDTH) OR
                              error_byte_r1(i+ (NUM_DQ_PINS*2/8)) OR 
                              error_byte_r1(i+ (NUM_DQ_PINS*3/8)));
                              
         cumlative_dq_lane_error_c(i) <=  cumlative_dq_lane_error_reg(i) OR dq_lane_error_r1(i);
      end  generate;
      
     
      process (clk_i)
      begin
         IF (clk_i'event and clk_i = '1') then
             IF (rst_i(1) = '1' or manual_clear_error = '1') THEN
                
               dq_lane_error_r1 <=  (others => '0');
               dq_lane_error_r2 <=  (others => '0');
               data_valid_r <=  '0';
               cumlative_dq_lane_error_reg <=  (others => '0');
               
             ELSE 
               data_valid_r <=  data_valid_i;
             
               dq_lane_error_r1 <=  dq_lane_error;
               cumlative_dq_lane_error_reg <=  cumlative_dq_lane_error_c;
             END IF;
           
      
         END IF;
      end process;
      
      
      
   end generate;

   xhdl8 : if ((FAMILY = "VIRTEX6") and (MEM_BURST_LEN = 8)) generate
      
      gen_cmp_8 : FOR i IN 0 TO  NUM_DQ_PINS / 2 - 1 GENERATE
         error_byte(i) <= '1' WHEN (data_valid_i = '1' AND (data_i(8 * (i + 1) - 1 DOWNTO 8 * i) /= cmp_data(8 * (i + 1) - 1 DOWNTO 8 * i))) ELSE '0';
      end generate;

      process (clk_i)
      begin
         if (clk_i'event and clk_i = '1') then
             IF (rst_i(1) = '1' or manual_clear_error = '1') THEN
                    error_byte_r1 <= (others => '0');
                    data_error    <= '0';
             ELSE
         
                    error_byte_r1 <= error_byte;
                    --FOR i IN 0 TO  DWIDTH - 1 LOOP
                    --  data_error <= error_byte_r1(i) OR data_error;
                    --END LOOP;
                    data_error <= REDUCTION_OR(error_byte_r1);--error_byte_r1(i) OR data_error;
                
                         --synthesis translate_off   
                    IF (data_error = '1') THEN               
                       
                       report "DATA ERROR"; -- severity ERROR;
                    end if;
                 --synthesis translate_on
             END IF;
         end if;
      end process;
      
      
      gen_dq_error_map: FOR i IN 0 to DQ_ERROR_WIDTH - 1 generate
         dq_lane_error(i) <= (error_byte_r1(i) OR error_byte_r1(i+DQ_ERROR_WIDTH) OR
                              error_byte_r1(i+ (NUM_DQ_PINS*2/8)) OR 
                              error_byte_r1(i+ (NUM_DQ_PINS*3/8)));
                              
         cumlative_dq_lane_error_c(i) <=  cumlative_dq_lane_error_reg(i) OR dq_lane_error_r1(i);
      end  generate;
      
      process (clk_i)
      begin
         IF (clk_i'event and clk_i = '1') then
             IF (rst_i(1) = '1' or manual_clear_error = '1') THEN
                
               dq_lane_error_r1 <=  (others => '0');
               dq_lane_error_r2 <=  (others => '0');
               data_valid_r <=  '0';
               cumlative_dq_lane_error_reg <=  (others => '0');
               
             ELSE 
               data_valid_r <=  data_valid_i;
             
               dq_lane_error_r1 <=  dq_lane_error;
               cumlative_dq_lane_error_reg <=  cumlative_dq_lane_error_c;
             END IF;
           
      
         END IF;
      end process;
            
   end generate;
   cumlative_dq_lane_error_r <= cumlative_dq_lane_error_reg;
   
   dq_error_bytelane_cmp <= dq_lane_error_r1;     

   data_error_o <= data_error;
   
end architecture trans;




