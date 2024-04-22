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
-- /___/  \  /    Vendor             : Xilinx
-- \   \   \/     Version            : 3.92
--  \   \         Application        : MIG
--  /   /         Filename           : memc3_tb_top.vhd
-- /___/   /\     Date Last Modified : $Date: 2011/06/02 07:16:56 $
-- \   \  /  \    Date Created       : Jul 03 2009
--  \___\/\___\
--
--Device           : Spartan-6
--Design Name      : DDR/DDR2/DDR3/LPDDR
--Purpose          : This is top level module for test bench. which instantiates 
--                   init_mem_pattern_ctr and mcb_traffic_gen modules for each user
--                   port.
--Reference        :
--Revision History :
--*****************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity memc3_tb_top is
generic
  (
      C_P0_MASK_SIZE                   : integer := 4;
      C_P0_DATA_PORT_SIZE              : integer := 32;
      C_P1_MASK_SIZE                   : integer := 4;
      C_P1_DATA_PORT_SIZE              : integer := 32;
      C_MEM_BURST_LEN                  : integer := 8;
      C_SIMULATION                     : string  := "FALSE";
      C_MEM_NUM_COL_BITS               : integer := 11;
      C_NUM_DQ_PINS                    : integer := 8;
      C_SMALL_DEVICE                   : string := "FALSE";
            C_p2_BEGIN_ADDRESS                      : std_logic_vector(31 downto 0)  := X"00000100";
      C_p2_DATA_MODE                          : std_logic_vector(3 downto 0)  := "0010";
      C_p2_END_ADDRESS                        : std_logic_vector(31 downto 0)  := X"000002ff";
      C_p2_PRBS_EADDR_MASK_POS                : std_logic_vector(31 downto 0)  := X"fffffc00";
      C_p2_PRBS_SADDR_MASK_POS                : std_logic_vector(31 downto 0)  := X"00000100";
      C_p3_BEGIN_ADDRESS                      : std_logic_vector(31 downto 0)  := X"00000500";
      C_p3_DATA_MODE                          : std_logic_vector(3 downto 0)  := "0010";
      C_p3_END_ADDRESS                        : std_logic_vector(31 downto 0)  := X"000006ff";
      C_p3_PRBS_EADDR_MASK_POS                : std_logic_vector(31 downto 0)  := X"fffff800";
      C_p3_PRBS_SADDR_MASK_POS                : std_logic_vector(31 downto 0)  := X"00000500"
  );
port
(
   clk0            : in std_logic;
   rst0            : in std_logic;
   calib_done      : in std_logic;
      p2_mcb_cmd_en_o                           : out std_logic;
      p2_mcb_cmd_instr_o                        : out std_logic_vector(2 downto 0);
      p2_mcb_cmd_bl_o                           : out std_logic_vector(5 downto 0);
      p2_mcb_cmd_addr_o                         : out std_logic_vector(29 downto 0);
      p2_mcb_cmd_full_i                         : in std_logic;

      p2_mcb_rd_en_o                            : out std_logic;
      p2_mcb_rd_data_i                          : in std_logic_vector(31 downto 0);
      p2_mcb_rd_empty_i                         : in std_logic;
      p2_mcb_rd_fifo_counts                     : in std_logic_vector(6 downto 0);

      p3_mcb_cmd_en_o                           : out std_logic;
      p3_mcb_cmd_instr_o                        : out std_logic_vector(2 downto 0);
      p3_mcb_cmd_bl_o                           : out std_logic_vector(5 downto 0);
      p3_mcb_cmd_addr_o                         : out std_logic_vector(29 downto 0);
      p3_mcb_cmd_full_i                         : in std_logic;

      p3_mcb_wr_en_o                            : out std_logic;
      p3_mcb_wr_mask_o                          : out std_logic_vector(3 downto 0);
      p3_mcb_wr_data_o                          : out std_logic_vector(31 downto 0);
      p3_mcb_wr_full_i                          : in std_logic;
      p3_mcb_wr_fifo_counts                     : in std_logic_vector(6 downto 0);



   vio_modify_enable   : in std_logic;
   vio_data_mode_value : in std_logic_vector(2 downto 0);
   vio_addr_mode_value : in std_logic_vector(2 downto 0);
   cmp_error       : out std_logic;
   cmp_data        : out std_logic_vector(31 downto 0);
   cmp_data_valid  : out std_logic;
   error           : out std_logic;
   error_status    : out std_logic_vector(127 downto 0)
);
end memc3_tb_top;

architecture arc of memc3_tb_top is

function ERROR_DQWIDTH (val_i : integer) return integer is
begin
  if (val_i = 4) then
    return 1;
  else
    return val_i/8;
  end if;
end function ERROR_DQWIDTH;

constant DQ_ERROR_WIDTH : integer := ERROR_DQWIDTH(C_NUM_DQ_PINS);

component init_mem_pattern_ctr IS
   generic (
      FAMILY                         : string;
      BEGIN_ADDRESS                  : std_logic_vector(31 downto 0);
      END_ADDRESS                    : std_logic_vector(31 downto 0);
      DWIDTH                         : integer;
      CMD_SEED_VALUE                 : std_logic_vector(31 downto 0);
      DATA_SEED_VALUE                : std_logic_vector(31 downto 0);
      DATA_MODE                      : std_logic_vector(3 downto 0);
      PORT_MODE                      : string
   );
   PORT (
      clk_i                          : in std_logic;
      rst_i                          : in std_logic;
      mcb_cmd_bl_i                   : in std_logic_vector(5 downto 0);
      mcb_cmd_en_i                   : in std_logic;
      mcb_cmd_instr_i                : in std_logic_vector(2 downto 0);
      mcb_init_done_i                : in std_logic;
      mcb_wr_en_i                    : in std_logic;
      vio_modify_enable              : in std_logic;
      vio_data_mode_value            : in std_logic_vector(2 downto 0);
      vio_addr_mode_value            : in std_logic_vector(2 downto 0);
      vio_bl_mode_value              : in STD_LOGIC_VECTOR(1 downto 0);
      vio_fixed_bl_value             : in STD_LOGIC_VECTOR(5 downto 0);
      cmp_error                      : in std_logic;
      run_traffic_o                  : out std_logic;
      start_addr_o                   : out std_logic_vector(31 downto 0);
      end_addr_o                     : out std_logic_vector(31 downto 0);
      cmd_seed_o                     : out std_logic_vector(31 downto 0);
      data_seed_o                    : out std_logic_vector(31 downto 0);
      load_seed_o                    : out std_logic;
      addr_mode_o                    : out std_logic_vector(2 downto 0);
      instr_mode_o                   : out std_logic_vector(3 downto 0);
      bl_mode_o                      : out std_logic_vector(1 downto 0);
      data_mode_o                    : out std_logic_vector(3 downto 0);
      mode_load_o                    : out std_logic;
      fixed_bl_o                     : out std_logic_vector(5 downto 0);
      fixed_instr_o                  : out std_logic_vector(2 downto 0);
      fixed_addr_o                   : out std_logic_vector(31 downto 0)
   );
end component;

component mcb_traffic_gen is
   generic (

      FAMILY                         : string;
      SIMULATION                     : string;
      MEM_BURST_LEN                  : integer;
      PORT_MODE                      : string;
      DATA_PATTERN                   : string;
      CMD_PATTERN                    : string;
      ADDR_WIDTH                     : integer;
      CMP_DATA_PIPE_STAGES           : integer;
      MEM_COL_WIDTH                  : integer;
      NUM_DQ_PINS                    : integer;
      DQ_ERROR_WIDTH                 : integer;
      DWIDTH                         : integer;
      PRBS_EADDR_MASK_POS            : std_logic_vector(31 downto 0);
      PRBS_SADDR_MASK_POS            : std_logic_vector(31 downto 0);
      PRBS_EADDR                     : std_logic_vector(31 downto 0);
      PRBS_SADDR                     : std_logic_vector(31 downto 0)
   );
   port (

      clk_i                          : in std_logic;
      rst_i                          : in std_logic;
      run_traffic_i                  : in std_logic;
      manual_clear_error             : in std_logic;
      -- *** runtime parameter ***
      start_addr_i                   : in std_logic_vector(31 downto 0);
      end_addr_i                     : in std_logic_vector(31 downto 0);
      cmd_seed_i                     : in std_logic_vector(31 downto 0);
      data_seed_i                    : in std_logic_vector(31 downto 0);
      load_seed_i                    : in std_logic;

      addr_mode_i                    : in std_logic_vector(2 downto 0);
      instr_mode_i                   : in std_logic_vector(3 downto 0);
      bl_mode_i                      : in std_logic_vector(1 downto 0);
      data_mode_i                    : in std_logic_vector(3 downto 0);
      mode_load_i                    : in std_logic;

      -- fixed pattern inputs interface
      fixed_bl_i                     : in std_logic_vector(5 downto 0);
      fixed_instr_i                  : in std_logic_vector(2 downto 0);
      fixed_addr_i                   : in std_logic_vector(31 downto 0);
      fixed_data_i                   : IN STD_LOGIC_VECTOR(DWIDTH-1 DOWNTO 0);

      bram_cmd_i                     : in std_logic_vector(38 downto 0);
      bram_valid_i                   : in std_logic;
      bram_rdy_o                     : out std_logic;

      --///////////////////////////////////////////////////////////////////////////
      --  MCB INTERFACE
      -- interface to mcb command port
      mcb_cmd_en_o                   : out std_logic;
      mcb_cmd_instr_o                : out std_logic_vector(2 downto 0);
      mcb_cmd_addr_o                 : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
      mcb_cmd_bl_o                   : out std_logic_vector(5 downto 0);
      mcb_cmd_full_i                 : in std_logic;
      -- interface to mcb wr data port
      mcb_wr_en_o                    : out std_logic;
      mcb_wr_data_o                  : out std_logic_vector(DWIDTH - 1 downto 0);
      mcb_wr_mask_o                  : out std_logic_vector((DWIDTH / 8) - 1 downto 0);
      mcb_wr_data_end_o              : OUT std_logic;

      mcb_wr_full_i                  : in std_logic;
      mcb_wr_fifo_counts             : in std_logic_vector(6 downto 0);

      -- interface to mcb rd data port
      mcb_rd_en_o                    : out std_logic;
      mcb_rd_data_i                  : in std_logic_vector(DWIDTH - 1 downto 0);
      mcb_rd_empty_i                 : in std_logic;
      mcb_rd_fifo_counts             : in std_logic_vector(6 downto 0);
      --///////////////////////////////////////////////////////////////////////////
      -- status feedback
      counts_rst                     : in std_logic;
      wr_data_counts                 : out std_logic_vector(47 downto 0);
      rd_data_counts                 : out std_logic_vector(47 downto 0);
      cmp_data                       : out std_logic_vector(DWIDTH - 1 downto 0);
      cmp_data_valid                 : out std_logic;
      cmp_error			     : out std_logic;
      error                          : out std_logic;
      error_status                   : out std_logic_vector(64 + (2 * DWIDTH - 1) downto 0);
      mem_rd_data                    : out std_logic_vector(DWIDTH - 1 downto 0);
      dq_error_bytelane_cmp          : out std_logic_vector(DQ_ERROR_WIDTH - 1 downto 0);
      cumlative_dq_lane_error        : out std_logic_vector(DQ_ERROR_WIDTH - 1 downto 0)      

   );
end component;

   -- Function to determine the number of data patterns to be generated
   function DATA_PATTERN_CALC return string is
   begin
      if (C_SMALL_DEVICE = "FALSE") then
         return "DGEN_ALL";
      else
         return "DGEN_ADDR";
      end if;
   end function;

   constant FAMILY                        : string := "SPARTAN6";
   constant DATA_PATTERN                  : string := DATA_PATTERN_CALC;
   constant CMD_PATTERN                   : string := "CGEN_ALL";
   constant ADDR_WIDTH                    : integer := 30;
   constant CMP_DATA_PIPE_STAGES          : integer := 0;
   constant PRBS_SADDR_MASK_POS           : std_logic_vector(31 downto 0)  := X"00007000";
   constant PRBS_EADDR_MASK_POS           : std_logic_vector(31 downto 0)  := X"FFFF8000";
   constant PRBS_SADDR                    : std_logic_vector(31 downto 0)  := X"00005000";
   constant PRBS_EADDR                    : std_logic_vector(31 downto 0)  := X"00007fff";
   constant BEGIN_ADDRESS                 : std_logic_vector(31 downto 0)  := X"00000000";
   constant END_ADDRESS                   : std_logic_vector(31 downto 0)  := X"00000fff";
   constant DATA_MODE                     : std_logic_vector(3 downto 0) := "0010";


    
   constant p2_DWIDTH : integer := 32;
 
   constant p3_DWIDTH : integer := 32;
  
    
   constant p2_PORT_MODE                  : string := "RD_MODE";           

   constant p3_PORT_MODE                  : string := "WR_MODE";           


     
       

    
     

   
    

  
  

  
signal p0_mcb_cmd_addr_o_int  :  std_logic_vector(ADDR_WIDTH - 1 DOWNTO 0);
signal p0_mcb_cmd_bl_o_int    :  std_logic_vector(5 DOWNTO 0);    
signal p0_mcb_cmd_en_o_int    :  std_logic;      
signal p0_mcb_cmd_instr_o_int :  std_logic_vector(2 DOWNTO 0);                   
signal p0_mcb_wr_en_o_int     :  std_logic;      



	
--p2 Signal declarations
signal p2_tg_run_traffic           : std_logic;
signal p2_tg_start_addr            : std_logic_vector(31 downto 0);
signal p2_tg_end_addr              : std_logic_vector(31 downto 0);
signal p2_tg_cmd_seed              : std_logic_vector(31 downto 0);
signal p2_tg_data_seed             : std_logic_vector(31 downto 0);
signal p2_tg_load_seed             : std_logic;
signal p2_tg_addr_mode             : std_logic_vector(2 downto 0);
signal p2_tg_instr_mode            : std_logic_vector(3 downto 0);
signal p2_tg_bl_mode               : std_logic_vector(1 downto 0);
signal p2_tg_data_mode             : std_logic_vector(3 downto 0);
signal p2_tg_mode_load             : std_logic;
signal p2_tg_fixed_bl              : std_logic_vector(5 downto 0);
signal p2_tg_fixed_instr           : std_logic_vector(2 downto 0);
signal p2_tg_fixed_addr            : std_logic_vector(31 downto 0);
signal p2_error_status             : std_logic_vector(64 + (2*p2_DWIDTH - 1) downto 0);
signal p2_error                    : std_logic;
signal p2_cmp_error                : std_logic;
signal p2_cmp_data                 : std_logic_vector(p2_DWIDTH-1 downto 0);  
signal p2_cmp_data_valid           : std_logic;  

signal p2_mcb_cmd_en_o_int         : std_logic;
signal p2_mcb_cmd_instr_o_int      : std_logic_vector(2 downto 0);
signal p2_mcb_cmd_bl_o_int         : std_logic_vector(5 downto 0);
signal p2_mcb_cmd_addr_o_int       : std_logic_vector(29 downto 0);
signal p2_mcb_wr_en_o_int          : std_logic;

	
--p3 Signal declarations
signal p3_tg_run_traffic           : std_logic;
signal p3_tg_start_addr            : std_logic_vector(31 downto 0);
signal p3_tg_end_addr              : std_logic_vector(31 downto 0);
signal p3_tg_cmd_seed              : std_logic_vector(31 downto 0);
signal p3_tg_data_seed             : std_logic_vector(31 downto 0);
signal p3_tg_load_seed             : std_logic;
signal p3_tg_addr_mode             : std_logic_vector(2 downto 0);
signal p3_tg_instr_mode            : std_logic_vector(3 downto 0);
signal p3_tg_bl_mode               : std_logic_vector(1 downto 0);
signal p3_tg_data_mode             : std_logic_vector(3 downto 0);
signal p3_tg_mode_load             : std_logic;
signal p3_tg_fixed_bl              : std_logic_vector(5 downto 0);
signal p3_tg_fixed_instr           : std_logic_vector(2 downto 0);
signal p3_tg_fixed_addr            : std_logic_vector(31 downto 0);
signal p3_error_status             : std_logic_vector(64 + (2*p3_DWIDTH - 1) downto 0);
signal p3_error                    : std_logic;
signal p3_cmp_error                : std_logic;
signal p3_cmp_data                 : std_logic_vector(p3_DWIDTH-1 downto 0);  
signal p3_cmp_data_valid           : std_logic;  

signal p3_mcb_cmd_en_o_int         : std_logic;
signal p3_mcb_cmd_instr_o_int      : std_logic_vector(2 downto 0);
signal p3_mcb_cmd_bl_o_int         : std_logic_vector(5 downto 0);
signal p3_mcb_cmd_addr_o_int       : std_logic_vector(29 downto 0);
signal p3_mcb_wr_en_o_int          : std_logic;





signal   p2_mcb_wr_en_o          : std_logic;
signal   p2_mcb_wr_full_i        : std_logic;
signal   p2_mcb_wr_data_o        : std_logic_vector(31 downto 0);
signal   p2_mcb_wr_mask_o        : std_logic_vector(3 downto 0);
signal   p2_mcb_wr_fifo_counts   : std_logic_vector(6 downto 0);



signal p3_mcb_rd_en_o        : std_logic;
signal p3_mcb_rd_empty_i     : std_logic;
signal p3_mcb_rd_fifo_counts : std_logic_vector(6 downto 0);
signal p3_mcb_rd_data_i : std_logic_vector(31 downto 0);





--signal cmp_data : std_logic_vector(31 downto 0);
begin

   cmp_error       <= p2_cmp_error or p3_cmp_error;
   error           <= p2_error or p3_error;
   error_status    <= p2_error_status;
   cmp_data        <= p2_cmp_data(31 downto 0);
   cmp_data_valid  <= p2_cmp_data_valid;


p2_mcb_cmd_en_o     <= p2_mcb_cmd_en_o_int;
p2_mcb_cmd_instr_o  <= p2_mcb_cmd_instr_o_int;
p2_mcb_cmd_bl_o     <= p2_mcb_cmd_bl_o_int;
p2_mcb_cmd_addr_o   <= p2_mcb_cmd_addr_o_int;
p2_mcb_wr_en_o     <= p2_mcb_wr_en_o_int;

 init_mem_pattern_ctr_p2 :init_mem_pattern_ctr 
 generic map
 	 (
    DWIDTH            =>    p2_DWIDTH,
    FAMILY            =>    FAMILY,
    BEGIN_ADDRESS     =>    C_p3_BEGIN_ADDRESS,
    END_ADDRESS       =>    C_p3_END_ADDRESS,
    CMD_SEED_VALUE    =>    X"56456783",
    DATA_SEED_VALUE   =>    X"12345678",
    DATA_MODE         =>    C_p3_DATA_MODE,
    PORT_MODE         =>    p2_PORT_MODE
	
   )
 port map
    (
    clk_i              =>   clk0,
    rst_i              =>   rst0,
                       
    mcb_cmd_en_i       =>   p3_mcb_cmd_en_o_int,
    mcb_cmd_instr_i    =>   p3_mcb_cmd_instr_o_int,
    mcb_cmd_bl_i       =>   p3_mcb_cmd_bl_o_int,
    mcb_wr_en_i        =>   p3_mcb_wr_en_o_int,

    vio_modify_enable  =>	vio_modify_enable,
    vio_data_mode_value =>  vio_data_mode_value,
    vio_addr_mode_value =>  vio_addr_mode_value,
    vio_bl_mode_value	=>  "10",--vio_bl_mode_value,
    vio_fixed_bl_value	=>  "000000",--vio_fixed_bl_value,  
                       
    mcb_init_done_i    =>   calib_done,
    cmp_error          =>   p2_error,
    run_traffic_o      =>   p2_tg_run_traffic, 
    start_addr_o       =>   p2_tg_start_addr,
    end_addr_o         =>   p2_tg_end_addr   ,
    cmd_seed_o         =>   p2_tg_cmd_seed   , 
    data_seed_o        =>   p2_tg_data_seed  ,
    load_seed_o        =>   p2_tg_load_seed  ,
    addr_mode_o        =>   p2_tg_addr_mode  ,
    instr_mode_o       =>   p2_tg_instr_mode ,
    bl_mode_o          =>   p2_tg_bl_mode    ,
    data_mode_o        =>   p2_tg_data_mode  ,
    mode_load_o        =>   p2_tg_mode_load  ,
    fixed_bl_o         =>   p2_tg_fixed_bl   ,
    fixed_instr_o      =>   p2_tg_fixed_instr,
    fixed_addr_o       =>   p2_tg_fixed_addr 
  );

 m_traffic_gen_p2 :  mcb_traffic_gen 
 generic map(  
    MEM_BURST_LEN        => C_MEM_BURST_LEN, 
    MEM_COL_WIDTH        => C_MEM_NUM_COL_BITS,
    NUM_DQ_PINS          => C_NUM_DQ_PINS,
    DQ_ERROR_WIDTH       => DQ_ERROR_WIDTH,
                         
    PORT_MODE            => p2_PORT_MODE,    
    DWIDTH               => p2_DWIDTH,
    CMP_DATA_PIPE_STAGES => CMP_DATA_PIPE_STAGES,                     
    FAMILY               => FAMILY,
    SIMULATION           => "FALSE",
    DATA_PATTERN         => DATA_PATTERN,  
    CMD_PATTERN          => "CGEN_ALL",
    ADDR_WIDTH           => 30,
    PRBS_SADDR_MASK_POS  => C_p3_PRBS_SADDR_MASK_POS,
    PRBS_EADDR_MASK_POS  => C_p3_PRBS_EADDR_MASK_POS,
    PRBS_SADDR           => C_p3_BEGIN_ADDRESS,
    PRBS_EADDR           => C_p3_END_ADDRESS
  )  
 port map
  (  
    clk_i                =>  clk0,
    rst_i                =>  rst0,
    run_traffic_i        =>  p2_tg_run_traffic,
    manual_clear_error   =>  rst0,
   -- runtime parameter  
    start_addr_i         =>  p2_tg_start_addr ,
    end_addr_i           =>  p2_tg_end_addr   ,
    cmd_seed_i           =>  p2_tg_cmd_seed   ,
    data_seed_i          =>  p2_tg_data_seed  ,
    load_seed_i          =>  p2_tg_load_seed,
    addr_mode_i          =>  p2_tg_addr_mode,
                         
    instr_mode_i         =>  p2_tg_instr_mode ,
    bl_mode_i            =>  p2_tg_bl_mode    ,
    data_mode_i          =>  p2_tg_data_mode  ,
    mode_load_i          =>  p2_tg_mode_load  ,
    
    -- fixed pattern inputs interface  
    fixed_bl_i           =>  p2_tg_fixed_bl,      
    fixed_instr_i        =>  p2_tg_fixed_instr,   
    fixed_addr_i         =>  p2_tg_fixed_addr,
    fixed_data_i         =>  (others => '0'),
    -- BRAM interface. 
    bram_cmd_i           =>  (others => '0'),
    bram_valid_i         =>  '0',
    bram_rdy_o           =>  open, 
    
    --  MCB INTERFACE  
    mcb_cmd_en_o	 =>  p2_mcb_cmd_en_o_int, 
    mcb_cmd_instr_o	 =>  p2_mcb_cmd_instr_o_int, 
    mcb_cmd_bl_o	 =>  p2_mcb_cmd_bl_o_int, 
    mcb_cmd_addr_o	 =>  p2_mcb_cmd_addr_o_int, 
    mcb_cmd_full_i	 =>  p2_mcb_cmd_full_i, 
    
    mcb_wr_en_o		 =>  p2_mcb_wr_en_o_int, 
    mcb_wr_mask_o	 =>  p2_mcb_wr_mask_o, 
    mcb_wr_data_o	 =>  p2_mcb_wr_data_o, 
    mcb_wr_data_end_o    =>  open, 
    mcb_wr_full_i	 =>  p2_mcb_wr_full_i, 
    mcb_wr_fifo_counts	 =>  p2_mcb_wr_fifo_counts, 
    
    mcb_rd_en_o		 =>  p2_mcb_rd_en_o, 
    mcb_rd_data_i	 =>  p2_mcb_rd_data_i, 
    mcb_rd_empty_i	 =>  p2_mcb_rd_empty_i, 
    mcb_rd_fifo_counts	 =>  p2_mcb_rd_fifo_counts, 

    -- status feedback   
    counts_rst           =>  rst0,
    wr_data_counts       =>  open,
    rd_data_counts       =>  open,
    cmp_data             =>  p2_cmp_data,      
    cmp_data_valid       =>  p2_cmp_data_valid,      
    cmp_error            =>  p2_cmp_error,        
    error                =>  p2_error,        
    error_status         =>  p2_error_status,
    mem_rd_data          =>  open,
    dq_error_bytelane_cmp   => open,
    cumlative_dq_lane_error => open
  );         



p3_mcb_cmd_en_o     <= p3_mcb_cmd_en_o_int;
p3_mcb_cmd_instr_o  <= p3_mcb_cmd_instr_o_int;
p3_mcb_cmd_bl_o     <= p3_mcb_cmd_bl_o_int;
p3_mcb_cmd_addr_o   <= p3_mcb_cmd_addr_o_int;
p3_mcb_wr_en_o     <= p3_mcb_wr_en_o_int;

 init_mem_pattern_ctr_p3 :init_mem_pattern_ctr 
 generic map
 	 (
    DWIDTH            =>    p3_DWIDTH,
    FAMILY            =>    FAMILY,
    BEGIN_ADDRESS     =>    C_p3_BEGIN_ADDRESS,
    END_ADDRESS       =>    C_p3_END_ADDRESS,
    CMD_SEED_VALUE    =>    X"56456783",
    DATA_SEED_VALUE   =>    X"12345678",
    DATA_MODE         =>    C_p3_DATA_MODE,
    PORT_MODE         =>    p3_PORT_MODE
	
   )
 port map
    (
    clk_i              =>   clk0,
    rst_i              =>   rst0,
                       
    mcb_cmd_en_i       =>   p3_mcb_cmd_en_o_int,
    mcb_cmd_instr_i    =>   p3_mcb_cmd_instr_o_int,
    mcb_cmd_bl_i       =>   p3_mcb_cmd_bl_o_int,
    mcb_wr_en_i        =>   p3_mcb_wr_en_o_int,

    vio_modify_enable  =>	vio_modify_enable,
    vio_data_mode_value =>  vio_data_mode_value,
    vio_addr_mode_value =>  vio_addr_mode_value,
    vio_bl_mode_value	=>  "10",--vio_bl_mode_value,
    vio_fixed_bl_value	=>  "000000",--vio_fixed_bl_value,  
                       
    mcb_init_done_i    =>   calib_done,
    cmp_error          =>   p3_error,
    run_traffic_o      =>   p3_tg_run_traffic, 
    start_addr_o       =>   p3_tg_start_addr,
    end_addr_o         =>   p3_tg_end_addr   ,
    cmd_seed_o         =>   p3_tg_cmd_seed   , 
    data_seed_o        =>   p3_tg_data_seed  ,
    load_seed_o        =>   p3_tg_load_seed  ,
    addr_mode_o        =>   p3_tg_addr_mode  ,
    instr_mode_o       =>   p3_tg_instr_mode ,
    bl_mode_o          =>   p3_tg_bl_mode    ,
    data_mode_o        =>   p3_tg_data_mode  ,
    mode_load_o        =>   p3_tg_mode_load  ,
    fixed_bl_o         =>   p3_tg_fixed_bl   ,
    fixed_instr_o      =>   p3_tg_fixed_instr,
    fixed_addr_o       =>   p3_tg_fixed_addr 
  );

 m_traffic_gen_p3 :  mcb_traffic_gen 
 generic map(  
    MEM_BURST_LEN        => C_MEM_BURST_LEN, 
    MEM_COL_WIDTH        => C_MEM_NUM_COL_BITS,
    NUM_DQ_PINS          => C_NUM_DQ_PINS,
    DQ_ERROR_WIDTH       => DQ_ERROR_WIDTH,
                         
    PORT_MODE            => p3_PORT_MODE,    
    DWIDTH               => p3_DWIDTH,
    CMP_DATA_PIPE_STAGES => CMP_DATA_PIPE_STAGES,                     
    FAMILY               => FAMILY,
    SIMULATION           => "FALSE",
    DATA_PATTERN         => DATA_PATTERN,  
    CMD_PATTERN          => "CGEN_ALL",
    ADDR_WIDTH           => 30,
    PRBS_SADDR_MASK_POS  => C_p3_PRBS_SADDR_MASK_POS,
    PRBS_EADDR_MASK_POS  => C_p3_PRBS_EADDR_MASK_POS,
    PRBS_SADDR           => C_p3_BEGIN_ADDRESS,
    PRBS_EADDR           => C_p3_END_ADDRESS
  )  
 port map
  (  
    clk_i                =>  clk0,
    rst_i                =>  rst0,
    run_traffic_i        =>  p3_tg_run_traffic,
    manual_clear_error   =>  rst0,
   -- runtime parameter  
    start_addr_i         =>  p3_tg_start_addr ,
    end_addr_i           =>  p3_tg_end_addr   ,
    cmd_seed_i           =>  p3_tg_cmd_seed   ,
    data_seed_i          =>  p3_tg_data_seed  ,
    load_seed_i          =>  p3_tg_load_seed,
    addr_mode_i          =>  p3_tg_addr_mode,
                         
    instr_mode_i         =>  p3_tg_instr_mode ,
    bl_mode_i            =>  p3_tg_bl_mode    ,
    data_mode_i          =>  p3_tg_data_mode  ,
    mode_load_i          =>  p3_tg_mode_load  ,
    
    -- fixed pattern inputs interface  
    fixed_bl_i           =>  p3_tg_fixed_bl,      
    fixed_instr_i        =>  p3_tg_fixed_instr,   
    fixed_addr_i         =>  p3_tg_fixed_addr,
    fixed_data_i         =>  (others => '0'),
    -- BRAM interface. 
    bram_cmd_i           =>  (others => '0'),
    bram_valid_i         =>  '0',
    bram_rdy_o           =>  open, 
    
    --  MCB INTERFACE  
    mcb_cmd_en_o	 =>  p3_mcb_cmd_en_o_int, 
    mcb_cmd_instr_o	 =>  p3_mcb_cmd_instr_o_int, 
    mcb_cmd_bl_o	 =>  p3_mcb_cmd_bl_o_int, 
    mcb_cmd_addr_o	 =>  p3_mcb_cmd_addr_o_int, 
    mcb_cmd_full_i	 =>  p3_mcb_cmd_full_i, 
    
    mcb_wr_en_o		 =>  p3_mcb_wr_en_o_int, 
    mcb_wr_mask_o	 =>  p3_mcb_wr_mask_o, 
    mcb_wr_data_o	 =>  p3_mcb_wr_data_o, 
    mcb_wr_data_end_o    =>  open, 
    mcb_wr_full_i	 =>  p3_mcb_wr_full_i, 
    mcb_wr_fifo_counts	 =>  p3_mcb_wr_fifo_counts, 
    
    mcb_rd_en_o		 =>  p3_mcb_rd_en_o, 
    mcb_rd_data_i	 =>  p3_mcb_rd_data_i, 
    mcb_rd_empty_i	 =>  p3_mcb_rd_empty_i, 
    mcb_rd_fifo_counts	 =>  p3_mcb_rd_fifo_counts, 

    -- status feedback   
    counts_rst           =>  rst0,
    wr_data_counts       =>  open,
    rd_data_counts       =>  open,
    cmp_data             =>  p3_cmp_data,      
    cmp_data_valid       =>  p3_cmp_data_valid,      
    cmp_error            =>  p3_cmp_error,        
    error                =>  p3_error,        
    error_status         =>  p3_error_status,
    mem_rd_data          =>  open,
    dq_error_bytelane_cmp   => open,
    cumlative_dq_lane_error => open
  );         


end architecture;

