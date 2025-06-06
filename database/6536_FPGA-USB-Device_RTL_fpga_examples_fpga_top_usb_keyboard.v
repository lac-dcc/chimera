// This program was cloned from: https://github.com/WangXuan95/FPGA-USB-Device
// License: GNU General Public License v3.0


//--------------------------------------------------------------------------------------------------------
// Module  : fpga_top_usb_keyboard
// Type    : synthesizable, fpga top
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: example for usb_keyboard_top
//--------------------------------------------------------------------------------------------------------

module fpga_top_usb_keyboard (
    // clock
    input  wire        clk50mhz,     // connect to a 50MHz oscillator
    // reset button
    input  wire        button,       // connect to a reset button, 0=reset, 1=release. If you don't have a button, tie this signal to 1.
    // LED
    output wire        led,          // 1: USB connected , 0: USB disconnected
    // USB signals
    output wire        usb_dp_pull,  // connect to USB D+ by an 1.5k resistor
    inout              usb_dp,       // connect to USB D+
    inout              usb_dn,       // connect to USB D-
    // debug output info, only for USB developers, can be ignored for normally use
    output wire        uart_tx       // If you want to see the debug info of USB device core, please connect this UART signal to host-PC (UART format: 115200,8,n,1), otherwise you can ignore this signal.
);




//-------------------------------------------------------------------------------------------------------------------------------------
// The USB controller core needs a 60MHz clock, this PLL module is to convert clk50mhz to clk60mhz
// This PLL module is only available on Altera Cyclone IV E.
// If you use other FPGA families, please use their compatible primitives or IP-cores to generate clk60mhz
//-------------------------------------------------------------------------------------------------------------------------------------
wire [3:0] subwire0;
wire       clk60mhz;
wire       clk_locked;
altpll u_altpll (
    .inclk       ( {1'b0, clk50mhz}     ),
    .clk         ( {subwire0, clk60mhz} ),
    .locked      ( clk_locked           ),
    .activeclock (),    .areset (1'b0),    .clkbad (),    .clkena ({6{1'b1}}),    .clkloss (),    .clkswitch (1'b0),    .configupdate (1'b0),    .enable0 (),    .enable1 (),    .extclk (),    .extclkena ({4{1'b1}}),    .fbin (1'b1),    .fbmimicbidir (),    .fbout (),    .fref (),    .icdrclk (),    .pfdena (1'b1),    .phasecounterselect ({4{1'b1}}),    .phasedone (),    .phasestep (1'b1),    .phaseupdown (1'b1),    .pllena (1'b1),    .scanaclr (1'b0),    .scanclk (1'b0),    .scanclkena (1'b1),    .scandata (1'b0),    .scandataout (),    .scandone (),    .scanread (1'b0),    .scanwrite (1'b0),    .sclkout0 (),    .sclkout1 (),    .vcooverrange (),    .vcounderrange () );
defparam u_altpll.bandwidth_type = "AUTO",    u_altpll.clk0_divide_by = 5,    u_altpll.clk0_duty_cycle = 50,    u_altpll.clk0_multiply_by = 6,    u_altpll.clk0_phase_shift = "0",    u_altpll.compensate_clock = "CLK0",    u_altpll.inclk0_input_frequency = 20000,    u_altpll.intended_device_family = "Cyclone IV E",    u_altpll.lpm_hint = "CBX_MODULE_PREFIX=pll",    u_altpll.lpm_type = "altpll",    u_altpll.operation_mode = "NORMAL",    u_altpll.pll_type = "AUTO",    u_altpll.port_activeclock = "PORT_UNUSED",    u_altpll.port_areset = "PORT_UNUSED",    u_altpll.port_clkbad0 = "PORT_UNUSED",    u_altpll.port_clkbad1 = "PORT_UNUSED",    u_altpll.port_clkloss = "PORT_UNUSED",    u_altpll.port_clkswitch = "PORT_UNUSED",    u_altpll.port_configupdate = "PORT_UNUSED",    u_altpll.port_fbin = "PORT_UNUSED",    u_altpll.port_inclk0 = "PORT_USED",    u_altpll.port_inclk1 = "PORT_UNUSED",    u_altpll.port_locked = "PORT_USED",    u_altpll.port_pfdena = "PORT_UNUSED",    u_altpll.port_phasecounterselect = "PORT_UNUSED",    u_altpll.port_phasedone = "PORT_UNUSED",    u_altpll.port_phasestep = "PORT_UNUSED",    u_altpll.port_phaseupdown = "PORT_UNUSED",    u_altpll.port_pllena = "PORT_UNUSED",    u_altpll.port_scanaclr = "PORT_UNUSED",    u_altpll.port_scanclk = "PORT_UNUSED",    u_altpll.port_scanclkena = "PORT_UNUSED",    u_altpll.port_scandata = "PORT_UNUSED",    u_altpll.port_scandataout = "PORT_UNUSED",    u_altpll.port_scandone = "PORT_UNUSED",    u_altpll.port_scanread = "PORT_UNUSED",    u_altpll.port_scanwrite = "PORT_UNUSED",    u_altpll.port_clk0 = "PORT_USED",    u_altpll.port_clk1 = "PORT_UNUSED",    u_altpll.port_clk2 = "PORT_UNUSED",    u_altpll.port_clk3 = "PORT_UNUSED",    u_altpll.port_clk4 = "PORT_UNUSED",    u_altpll.port_clk5 = "PORT_UNUSED",    u_altpll.port_clkena0 = "PORT_UNUSED",    u_altpll.port_clkena1 = "PORT_UNUSED",    u_altpll.port_clkena2 = "PORT_UNUSED",    u_altpll.port_clkena3 = "PORT_UNUSED",    u_altpll.port_clkena4 = "PORT_UNUSED",    u_altpll.port_clkena5 = "PORT_UNUSED",    u_altpll.port_extclk0 = "PORT_UNUSED",    u_altpll.port_extclk1 = "PORT_UNUSED",    u_altpll.port_extclk2 = "PORT_UNUSED",    u_altpll.port_extclk3 = "PORT_UNUSED",    u_altpll.self_reset_on_loss_lock = "OFF",    u_altpll.width_clock = 5;




//-------------------------------------------------------------------------------------------------------------------------------------
// USB-HID keyboard device
//-------------------------------------------------------------------------------------------------------------------------------------

reg        key_request = 1'b0;
reg [15:0] key_value   = 16'h0004;

usb_keyboard_top #(
    .DEBUG           ( "FALSE"             )    // If you want to see the debug info of USB device core, set this parameter to "TRUE"
) usb_keyboard_i (
    .rstn            ( clk_locked & button ),
    .clk             ( clk60mhz            ),
    // USB signals
    .usb_dp_pull     ( usb_dp_pull         ),
    .usb_dp          ( usb_dp              ),
    .usb_dn          ( usb_dn              ),
    // USB reset output
    .usb_rstn        ( led                 ),   // 1: connected , 0: disconnected (when USB cable unplug, or when system reset (rstn=0))
    // HID keyboard press signal
    .key_value       ( key_value           ),   // key_value runs from 16'h0004 (a) to 16'h0027 (9). The keyboard will type a~z and 0~9 cyclically.
    .key_request     ( key_request         ),   // key_request=1 pulse every 2 seconds. The keyboard will press a key every 2 seconds.
    // debug output info, only for USB developers, can be ignored for normally use
    .debug_en        (                     ),
    .debug_data      (                     ),
    .debug_uart_tx   ( uart_tx             )
);




//-------------------------------------------------------------------------------------------------------------------------------------
// press a key every 2 seconds
//-------------------------------------------------------------------------------------------------------------------------------------

reg [31:0] count = 0;             // count is a clock counter that runs from 0 to 120000000, each period takes 2 seconds

always @ (posedge clk60mhz)
    if(count < 120000000) begin
        count <= count + 1;
        key_request <= 1'b0;
    end else begin               
        count <= 0;
        key_request <= 1'b1;      // press a key per 2 seconds
        key_value <= (key_value < 16'h0027) ? key_value + 16'h1 : 16'h0004;
    end



endmodule
