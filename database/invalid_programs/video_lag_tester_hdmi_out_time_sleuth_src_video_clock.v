`include "video_timing.vh"

`define PLL1_540 1
`define PLL1_351 0
`define PLL1_DONT_CARE 0

`define ODIV2 6'b111111
`define ODIV4 6'b111110
`define ODIV8 6'b111100
`define ODIV16 6'b111000
`define ODIV32 6'b110000
`define ODIV48 6'b101000
`define ODIV64 6'b100000
`define ODIV80 6'b011000
`define ODIV96 6'b010000
`define ODIV112 6'b001000
`define ODIV128 6'b000000


module video_clock (
  input wire clk27,
  input [3:0] clock_config,
  input wire rstn, 
  output reg hdmi_rstn_o,
  output wire clk_serial, //clk x5
  output wire clk_pixel   //clk x1
);

wire lock;

always @ (posedge clk27)
  hdmi_rstn_o <= rstn & lock;

reg pll1_config;

reg [5:0] fbdsel1;
reg [5:0] idsel1;
reg [5:0] odsel1;

reg [5:0] fbdsel2;
reg [5:0] idsel2;
reg [5:0] odsel2;

reg  [3:0] clksel;

wire clk2in;
wire clk1;
wire clk1d54;

always @ (*) begin
    ///** PLL2
    case (clock_config) 
        //10  -> 200
        `PIXEL_CLOCK_200: begin
            pll1_config <= `PLL1_540;
            clksel <= 4'b0100;
            fbdsel2 <= 64-20;
            idsel2 <= 64-1;
            odsel2 <= `ODIV4;
        end

        //351 -> 325
        `PIXEL_CLOCK_325: begin
            pll1_config <= `PLL1_351;
            clksel <= 4'b0010;
            fbdsel2 <= 64-25;
            idsel2 <= 64-27;
            odsel2 <= `ODIV2;
        end

        //27  -> 371.25
        `PIXEL_CLOCK_371_25: begin
            pll1_config <= `PLL1_DONT_CARE;
            clksel <= 4'b0001;
            fbdsel2 <= 64-55;
            idsel2 <= 64-4;
            odsel2 <= `ODIV2;
        end

        //27  -> 135
        `PIXEL_CLOCK_135 : begin
            pll1_config <= `PLL1_DONT_CARE;
            clksel <= 4'b0001;
            fbdsel2 <= 64-5;
            idsel2 <= 64-1;
            odsel2 <= `ODIV8;
        end

        //27  -> 126
        default : begin //PIXEL_CLOCK_126
            pll1_config = `PLL1_DONT_CARE;
            clksel <= 4'b0001;
            fbdsel2 <= 64-14;
            idsel2 <= 64-3;
            odsel2 <= `ODIV8;
        end

    endcase
end

always @ (*) begin
    ///** PLL1
    case (pll1_config) 
        `PLL1_351: begin
            //351 (clkoutd 6.5)
            fbdsel1 <= 64-13;
            idsel1 <= 64-1;
            odsel1 <= `ODIV2;
        end
        default: begin //PLL1_540
            //540 (clkoutd 10)
            fbdsel1 <= 64-20;
            idsel1  <= 64-1;
            odsel1 <= `ODIV2;
        end
    endcase
end


pll1 pll1_inst(
    .clkout(clk1),
    .clkoutd(clk1d54),
    .clkin(clk27),
    .fbdsel(fbdsel1),
    .idsel(idsel1),
    .odsel(odsel1)
);

pll2 pll2_inst (
    .clkout(clk_serial),
    .lock(lock),
    .clkin(clk2in),
    .fbdsel(fbdsel2),
    .idsel(idsel2),
    .odsel(odsel2)
);


//Gowin_PLLVR371_25 pll2_inst(clk_serial, lock, clk27);

Gowin_DCS dcs_inst(
    .clkout(clk2in),
    .clksel(clksel),
    .clk0(clk27),
    .clk1(clk1),
    .clk2(clk1d54),
    .clk3()
);

CLKDIV clkdiv5_inst
(
  .RESETN(hdmi_rstn_o),
  .HCLKIN(clk_serial),
  .CLKOUT(clk_pixel),
  .CALIB (1'b1)
);
defparam clkdiv5_inst.DIV_MODE="5";
defparam clkdiv5_inst.GSREN="false";

endmodule