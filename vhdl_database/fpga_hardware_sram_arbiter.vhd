library ieee;
use ieee.std_logic_1164.all;
use work.defines.all;

entity sram_arbiter is
  Port ( -- LSU wires
         lsu_sram_bus_control_1_in : in sram_bus_control_t;
         lsu_sram_bus_data_1_inout : inout sram_bus_data_t;
         lsu_sram_bus_control_2_in : in sram_bus_control_t;
         lsu_sram_bus_data_2_inout : inout sram_bus_data_t;
         lsu_mem_request_in          : in std_logic;

         -- VGA / HDMI wires
         vga_hdmi_sram_bus_control_1_in : in sram_bus_control_t;
         vga_hdmi_sram_bus_control_2_in : in sram_bus_control_t;
         vga_hdmi_sram_bus_data_1_inout : inout sram_bus_data_t;
         vga_hdmi_sram_bus_data_2_inout : inout sram_bus_data_t;
         vga_hdmi_request_accepted_out: out std_logic;

         -- Communication unit wires
         comm_sram_bus_control_1_in : in sram_bus_control_t;
         comm_sram_bus_control_2_in : in sram_bus_control_t;
         comm_sram_bus_data_1_inout : inout sram_bus_data_t;
         comm_sram_bus_data_2_inout : inout sram_bus_data_t;
         comm_mem_request_in : in std_logic;

         -- SRAM wires
         sram_bus_control_1_out : out sram_bus_control_t;
         sram_bus_data_1_inout : inout sram_bus_data_t;
         sram_bus_control_2_out : out sram_bus_control_t;
         sram_bus_data_2_inout : inout sram_bus_data_t);
end sram_arbiter;

architecture Behavioral of sram_arbiter is
begin



  process (sram_bus_data_1_inout
          ,sram_bus_data_2_inout
          ,comm_mem_request_in
          ,lsu_mem_request_in
          ,lsu_sram_bus_data_1_inout
          ,lsu_sram_bus_data_2_inout
          ,lsu_sram_bus_control_1_in
          ,lsu_sram_bus_control_2_in
          ,lsu_sram_bus_control_1_in.write_enable_n
          ,lsu_sram_bus_control_2_in.write_enable_n
          ,comm_sram_bus_data_1_inout
          ,comm_sram_bus_data_2_inout
          ,comm_sram_bus_control_1_in
          ,comm_sram_bus_control_2_in
          ,comm_sram_bus_control_1_in.write_enable_n
          ,comm_sram_bus_control_2_in.write_enable_n
          ,vga_hdmi_sram_bus_data_1_inout
          ,vga_hdmi_sram_bus_data_2_inout
          ,vga_hdmi_sram_bus_control_1_in
          ,vga_hdmi_sram_bus_control_2_in
          ,vga_hdmi_sram_bus_control_1_in.write_enable_n
          ,vga_hdmi_sram_bus_control_2_in.write_enable_n
          )

  begin
    vga_hdmi_request_accepted_out <= '0';
  -- Set default values
    sram_bus_data_1_inout <= (others=>'Z');
    sram_bus_data_2_inout <= (others=>'Z');

    comm_sram_bus_data_1_inout <= (others=>'Z');
    comm_sram_bus_data_2_inout <= (others=>'Z');

    lsu_sram_bus_data_1_inout <= (others=>'Z');
    lsu_sram_bus_data_2_inout <= (others=>'Z');

    vga_hdmi_sram_bus_data_1_inout <= (others=>'Z');
    vga_hdmi_sram_bus_data_2_inout <= (others=>'Z');

    -- Comm unit has highest priority
    if comm_mem_request_in = '1' then
        --Connect control signals
        sram_bus_control_1_out <= comm_sram_bus_control_1_in;
        sram_bus_control_2_out <= comm_sram_bus_control_2_in;

        --Connect data to SRAM 1
        if comm_sram_bus_control_1_in.write_enable_n = '0' then
            sram_bus_data_1_inout <= comm_sram_bus_data_1_inout;
        else
            comm_sram_bus_data_1_inout <= sram_bus_data_1_inout;
        end if;

        --Connect data to SRAM 2
        if comm_sram_bus_control_2_in.write_enable_n = '0' then
            sram_bus_data_2_inout <= comm_sram_bus_data_2_inout;
        else
            comm_sram_bus_data_2_inout <= sram_bus_data_2_inout;
        end if;

    -- LSU, that is the cores, has second priority
    elsif lsu_mem_request_in = '1' then
        --Connect control signals
        sram_bus_control_1_out <= lsu_sram_bus_control_1_in;
        sram_bus_control_2_out <= lsu_sram_bus_control_2_in;


        if lsu_sram_bus_control_1_in.write_enable_n = '0' then
            sram_bus_data_1_inout <= lsu_sram_bus_data_1_inout;
        else
            lsu_sram_bus_data_1_inout <= sram_bus_data_1_inout;
        end if;

        if lsu_sram_bus_control_2_in.write_enable_n = '0' then
            sram_bus_data_2_inout <= lsu_sram_bus_data_2_inout;
        else
            lsu_sram_bus_data_2_inout <= sram_bus_data_2_inout;
        end if;


    ----------------------------
    ---------- HDMI ------------
    -----------------------------
    else

      vga_hdmi_request_accepted_out <= '1';
        --Connect control signals
        sram_bus_control_1_out <= vga_hdmi_sram_bus_control_1_in;
        sram_bus_control_2_out <= vga_hdmi_sram_bus_control_2_in;
        

   end if;
end process;

-- Connect only one direction, as video never writes to memory
vga_hdmi_sram_bus_data_1_inout <= sram_bus_data_1_inout;
vga_hdmi_sram_bus_data_2_inout <= sram_bus_data_2_inout;

end Behavioral;

