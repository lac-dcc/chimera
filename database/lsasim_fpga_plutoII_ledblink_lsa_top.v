//a Note: created by CDL 1.3.6 - do not hand edit without recognizing it will be out of sync with the source
// Output mode 0 (VMOD=1, standard verilog=0)

//a Module lsa_top
module lsa_top
(
    in_clock,

    in_reset,

    out_led_out
);

    //b Clocks
    input in_clock;

    //b Inputs
    input in_reset;

    //b Outputs
    output out_led_out;

// output components here

    //b Output combinatorials
    reg out_led_out;

    //b Output nets

    //b Internal and output registers

    //b Internal combinatorials

    //b Internal nets
    wire net_led_out;
    wire [15:0]net_out_data;
    wire net_fetch;
    wire [15:0]net_in_data;
    wire [15:0]net_address;
    wire net_write_enable;
    wire net_output_enable;

    //b Clock gating module instances
    //b Module instances
    lsa_core lsa_core0(
        .clock_in(in_clock),
        .mem_in(net_out_data),
        .reset_in(in_reset),
        .mem_out(            net_in_data),
        .mem_fetch(            net_fetch),
        .mem_we(            net_write_enable),
        .mem_oe(            net_output_enable),
        .mem_add(            net_address)         );
    lsa_mem lsa_mem0(
        .clock_in(in_clock),
        .mem_fetch(net_fetch),
        .mem_we(net_write_enable),
        .mem_oe(net_output_enable),
        .mem_add(net_address),
        .mem_in(net_in_data),
        .reset_in(in_reset),
        .mem_led_out(            net_led_out),
        .mem_out(            net_out_data)         );
    //b the_code combinatorial process
    always @( //the_code
        net_led_out )
    begin: the_code__comb_code
        out_led_out = net_led_out;
    end //always

endmodule // lsa_top
