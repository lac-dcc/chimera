// This program was cloned from: https://github.com/chriz2600/time-sleuth
// License: MIT License

module lagtester(
    input clock,

    input [4:0] RES_CONFIG,

    inout wire SDA,
    inout wire SCL,

    input SENSOR,
    output [7:0] DVI_RED,
    output [7:0] DVI_GREEN,
    output [7:0] DVI_BLUE,
    output DVI_DE,
    output DVI_HSYNC,
    output DVI_VSYNC,
    output DVI_CLOCK,

    output TFP410_reset,
    output LED
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

    wire pll_locked;
    wire tfp410_ready;
    wire hpd_detected;

    ///////////////////////////////////////////
    // clocks
    pll_main pll(
        .clock(clock),
        .reset(1'b0),
        .data(config_data),

        .clock_out(internal_clock),
        .clock_out_video(DVI_CLOCK),
        .locked(pll_locked)
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

    ///////////////////////////////////////////
    // dvi transmitter
    TFP410 tfp410(
        .clk(clock),
        .reset(1'b1),
        .output_ready(pll_locked),
        .sda(SDA),
        .scl(SCL),
        .ready(tfp410_ready),
        .hpd_detected(hpd_detected)
    );
    ///////////////////////////////////////////

    assign LED = ~sensor_out;
    assign TFP410_reset = 1'b1;

endmodule