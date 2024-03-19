//a Note: created by CDL 1.3.6 - do not hand edit without recognizing it will be out of sync with the source
// Output mode 0 (VMOD=1, standard verilog=0)

//a Module ledblink
module ledblink
(
    clock_in,

    reset_in,

    led_out,
    uart_out
);

    //b Clocks
    input clock_in;

    //b Inputs
    input reset_in;

    //b Outputs
    output led_out;
    output uart_out;

// output components here

    //b Output combinatorials
    reg led_out;
    reg uart_out;

    //b Output nets

    //b Internal and output registers
    reg ustate;
    reg [11:0]ushift;
    reg [10:0]ucount;

    //b Internal combinatorials

    //b Internal nets
    wire [7:0]net_led_out;

    //b Clock gating module instances
    //b Module instances
    lsa_top lsa_top0(
        .in_clock(clock_in),
        .in_reset(reset_in),
        .out_led_out(            net_led_out)         );
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        ushift or
        net_led_out )
    begin: the_code__comb_code
        uart_out = ushift[0];
        led_out = net_led_out[4];
    end //always

    //b the_code__posedge_clock_in_active_low_reset_in clock process
    always @( posedge clock_in or negedge reset_in)
    begin : the_code__posedge_clock_in_active_low_reset_in__code
        if (reset_in==1'b0)
        begin
            ucount <= 11'h0;
            ushift <= 12'hfff;
            ustate <= 1'h0;
        end
        else
        begin
            if ((ucount==11'h4e1))
            begin
                ucount <= 11'h0;
                ushift[10:0] <= ushift[11:1];
                ushift[11] <= 1'h1;
            end //if
            else
            begin
                ucount <= (ucount+11'h1);
            end //else
            if ((net_led_out[4]!=ustate))
            begin
                ushift <= 12'hcc1;
                ustate <= net_led_out[4];
            end //if
        end //if
    end //always

endmodule // ledblink
