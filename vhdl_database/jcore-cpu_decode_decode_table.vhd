-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
-- This file is generated. Changing this file directly is probably
-- not what you want to do. Any changes will be overwritten next time
-- the generator is run.
-- ******************************************************************
-- ******************************************************************
-- ******************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.decode_pack.all;
use work.cpu2j0_components_pack.all;
use work.mult_pkg.all;
entity decode_table is
    port (
        clk : in std_logic;
        next_id_stall : in std_logic;
        op : in operation_t;
        t_bcc : in std_logic;
        debug : out std_logic;
        delay_jump : out std_logic;
        dispatch : out std_logic;
        event_ack_0 : out std_logic;
        ex : out pipeline_ex_t;
        ex_stall : out pipeline_ex_stall_t;
        id : out pipeline_id_t;
        ilevel_cap : out std_logic;
        mac_s_latch : out std_logic;
        mac_stall_sense : out std_logic;
        maskint_next : out std_logic;
        slp : out std_logic;
        wb : out pipeline_wb_t;
        wb_stall : out pipeline_wb_stall_t
    );
end;
