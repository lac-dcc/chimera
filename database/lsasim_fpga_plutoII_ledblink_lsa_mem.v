//a Note: created by CDL 1.3.6 - do not hand edit without recognizing it will be out of sync with the source
// Output mode 0 (VMOD=1, standard verilog=0)

//a Module lsa_mem
module lsa_mem
(
    clock_in,

    mem_fetch,
    mem_we,
    mem_oe,
    mem_add,
    mem_in,
    reset_in,

    mem_led_out,
    mem_out
);

    //b Clocks
    input clock_in;

    //b Inputs
    input mem_fetch;
    input mem_we;
    input mem_oe;
    input [15:0]mem_add;
    input [15:0]mem_in;
    input reset_in;

    //b Outputs
    output mem_led_out;
    output [15:0]mem_out;

// output components here

    //b Output combinatorials
    reg mem_led_out;
    reg [15:0]mem_out;

    //b Output nets

    //b Internal and output registers
    reg led_out_bits;

    //b Internal combinatorials

    //b Internal nets

    //b Clock gating module instances
    //b Module instances
    //b the_code__comb combinatorial process
    always @( //the_code__comb
        mem_oe or
        mem_add or
        led_out_bits )
    begin: the_code__comb_code
    reg [15:0]mem_out__var;
        mem_out__var = 16'hffff;
        if ((mem_oe==1'h1))
        begin
            case (mem_add) //synopsys parallel_case
            16'h0: // req 1
                begin
                mem_out__var = 16'hc001;
                end
            16'h1: // req 1
                begin
                mem_out__var = 16'hc000;
                end
            16'h2: // req 1
                begin
                mem_out__var = 16'h97f1;
                end
            16'h3: // req 1
                begin
                mem_out__var = 16'h9840;
                end
            16'h4: // req 1
                begin
                mem_out__var = 16'h6889;
                end
            16'h5: // req 1
                begin
                mem_out__var = 16'hc2fe;
                end
            16'h6: // req 1
                begin
                mem_out__var = 16'h6558;
                end
            16'h7: // req 1
                begin
                mem_out__var = 16'h4758;
                end
            16'h8: // req 1
                begin
                mem_out__var = 16'h9840;
                end
            16'h9: // req 1
                begin
                mem_out__var = 16'hc0fa;
                end
            default: // req 1
                begin
                mem_out__var = 16'hffff;
                end
            endcase
        end //if
        mem_led_out = led_out_bits;
        mem_out = mem_out__var;
    end //always

    //b the_code__posedge_clock_in_active_low_reset_in clock process
    always @( posedge clock_in or negedge reset_in)
    begin : the_code__posedge_clock_in_active_low_reset_in__code
        if (reset_in==1'b0)
        begin
            led_out_bits <= 1'h0;
        end
        else
        begin
            if ((mem_we==1'h1))
            begin
                if ((mem_add==16'hf100))
                begin
                    led_out_bits <= mem_in[8];
                end //if
            end //if
        end //if
    end //always

endmodule // lsa_mem
