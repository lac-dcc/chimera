`include "defines.v"


module lagtester(
    input clock,

    
    input SENSOR,

    output wire        O_tmds_clk_p,
    output wire        O_tmds_clk_n,
    output wire [2:0]  O_tmds_data_p,
    output wire [2:0]  O_tmds_data_n,

    output wire LED
);
    wire internal_clock;
    
    wire sensor_out;
    wire sensor_trigger;

    wire config_changed;
    wire [7:0] config_data;

    wire starttrigger;
    wire reset_counter;
    wire [7:0] config_data_crossed;
    wire [79:0] bcdcount_crossed;
    wire [19:0] bcd_current;
    wire [19:0] bcd_minimum;
    wire [19:0] bcd_maximum;
    wire [19:0] bcd_average;

    wire tfp410_ready;
    wire hpd_detected;

wire clk_serial;
wire hdmi_rstn;

    wire [4:0] RES_CONFIG = 5'b00001 ;

    wire [7:0] DVI_RED;
    wire [7:0] DVI_GREEN;
    wire [7:0] DVI_BLUE;
    wire DVI_DE;
    wire DVI_HSYN;
    wire DVI_VSYNC;

    ///////////////////////////////////////////
    // clocks

`define PIXEL_CLOCK_135 4'd3
`define PIXEL_CLOCK_371_25 4'd2
video_clock video_clock_inst (
  .clk27       (clock), 
  .clock_config(`PIXEL_CLOCK_371_25),
  .rstn        (1'b1),
  .hdmi_rstn_o (hdmi_rstn),
  .clk_serial  (clk_serial),
  .clk_pixel   (internal_clock)
);

hdmi_device hdmi_device (
    .I_rst_n       (hdmi_rstn         ),
    .I_serial_clk  (clk_serial        ),
    .I_rgb_clk     (internal_clock    ),
    .I_rgb_vs      (DVI_VSYNC ),
    .I_rgb_hs      (DVI_HSYNC ),
    .I_rgb_de      (DVI_DE    ),

     //.I_rgb_r       ({DVI_RED[7] ? 8'hff : 8'h11}),
     //.I_rgb_g       ({DVI_GREEN[7] ? 8'hff : 8'h11}),
     //.I_rgb_b       ({DVI_BLUE[7] ? 8'hff : 8'h11}),

     .I_rgb_r       (DVI_RED),
     .I_rgb_g       (DVI_GREEN),
     .I_rgb_b       (DVI_BLUE),
    .O_tmds_clk_p  (O_tmds_clk_p      ),
    .O_tmds_clk_n  (O_tmds_clk_n      ),
    .O_tmds_data_p (O_tmds_data_p     ),
    .O_tmds_data_n (O_tmds_data_n     )
);
    ///////////////////////////////////////////
    // sensor
    sensor sensor(
        .clock(clock),
        .sensor(SENSOR),
        .sensor_out(sensor_out),
        .sensor_trigger(sensor_trigger)
    );

    ///////////////////////////////////////////
    // config
    configuration configuration(
        .clock(clock),
        .config_in(RES_CONFIG),
        .config_data(config_data),
        .config_changed(config_changed)
    );

    ///////////////////////////////////////////
    // measurement
    Flag_CrossDomain reset_control(
        .clkA(internal_clock),
        .FlagIn_clkA(starttrigger),
        .clkB(clock),
        .FlagOut_clkB(reset_counter)
    );

    measure measure(
        .clock(clock),
        .reset_counter(reset_counter),
        .sensor_trigger(sensor_trigger),
        .reset_bcdoutput(config_changed),
        .bcd_current(bcd_current),
        .bcd_minimum(bcd_minimum),
        .bcd_maximum(bcd_maximum),
        .bcd_average(bcd_average)
    );

    ///////////////////////////////////////////
    // video generator
    data_cross #(
        .WIDTH(8)
    ) video_data_cross (
        .clkIn(clock),
        .clkOut(internal_clock),
        .dataIn(config_data),
        .dataOut(config_data_crossed)
    );

    data_cross #(
        .WIDTH(80)
    ) bcdcounter_cross (
        .clkIn(clock),
        .clkOut(internal_clock),
        .dataIn({ bcd_average, bcd_maximum, bcd_minimum, bcd_current }),
        .dataOut(bcdcount_crossed)
    );

    video video(

        .clock(internal_clock),
        .config_data(config_data_crossed),
        .bcdcount(bcdcount_crossed),
        .red(DVI_RED),
        .green(DVI_GREEN),
        .blue(DVI_BLUE),
        .de(DVI_DE),
        .hsync(DVI_HSYNC),
        .vsync(DVI_VSYNC),
        .starttrigger(starttrigger)
    );
    ///////////////////////////////////////////




reg         vs_r;
reg  [9:0]  cnt_vs;


always@(posedge internal_clock) begin
  vs_r <= DVI_VSYNC;
end
always@(posedge internal_clock) begin
    if(vs_r && !DVI_VSYNC) //vs falling edge
        cnt_vs <= cnt_vs + 10'd1;
end

 //assign LED = cnt_vs[6];

 assign LED = sensor_out;
 //   assign TFP410_reset = 1'b1;

endmodule
