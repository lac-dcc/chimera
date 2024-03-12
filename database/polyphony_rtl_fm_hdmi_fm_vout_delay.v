module fm_vout_delay (
    i_in,
    o_out,
    clk_sys,
    rst_x
);
parameter P_WIDTH     = 4;
// P_NUM_DELAY should be greater than 1
parameter P_NUM_DELAY = 6;

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input  [P_WIDTH-1:0] i_in;
    output [P_WIDTH-1:0] o_out;
    input                clk_sys;
    input                rst_x;
//////////////////////////////////
// regs 
//////////////////////////////////
    reg    [P_WIDTH-1:0] r_delay[0:P_NUM_DELAY-1];

//////////////////////////////////
// assign statement
//////////////////////////////////
    assign o_out = r_delay[P_NUM_DELAY-1];

//////////////////////////////////
// always statement
//////////////////////////////////
    always @(posedge clk_sys or negedge rst_x) begin
        if (~rst_x) begin
            r_delay[0] <= {P_WIDTH{1'b0}};
        end else begin
            r_delay[0] <= i_in;
        end
    end

    // delay register connection
    integer i;
    always @(posedge clk_sys or negedge rst_x) begin
        if (~rst_x) begin
            for ( i = 1; i < P_NUM_DELAY; i = i + 1) begin
                r_delay[i] <= {P_WIDTH{1'b0}};
            end
        end else begin
            for ( i = 1; i < P_NUM_DELAY; i = i + 1) begin
                r_delay[i] <= r_delay[i-1];
            end
        end
    end


endmodule
