module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    reg	[23:0]	data;
    // FSM from fsm_ps2
    parameter b1 = 2'd0, b2 = 2'd1, b3 = 2'd2, dn = 2'd3;
    reg	[1:0]	state, next_state;
    // State transition logic (combinational)
    always@(*) begin
        case({state, in[3]})
            {b1, 1'b0}:	next_state = b1;
            {b1, 1'b1}:	next_state = b2;
            {b2, 1'b0}:	next_state = b3;
            {b2, 1'b1}:	next_state = b3;
            {b3, 1'b0}:	next_state = dn;
            {b3, 1'b1}:	next_state = dn;
            {dn, 1'b0}:	next_state = b1;
            {dn, 1'b1}:	next_state = b2;
        endcase
    end
    // State flip-flops (sequential)
    always@(posedge clk) begin
        if(reset)
            state <= b1;
        else
            state <= next_state;
    end
    // Output logic
    assign	done = (state == dn);
    
    // New: Datapath to store incoming bytes.
    always@(posedge clk) begin
        if(reset)
            data <= 32'd0;
        else begin
            data[23:16] <= data[15:8];
            data[15:8] <= data[7:0];
            data[7:0] <= in;
        end
    end
    
    assign out_bytes = (done)?data:32'd0;
    
endmodule

