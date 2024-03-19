//////////////////////////////////////////////////////////////////////////////////
//
//
//  State machine that puts the start signal on output after waiting for 2**N clock ticks
//
//
//////////////////////////////////////////////////////////////////////////////////

module jump_control
#(parameter N=3)
(
	input  wire         clk, rst, 
	input  wire         start,   // start signal
        output wire         out ,    // output state
	output wire         tick     // trigger
);

//signal declaration
reg [N-1:0] cnt;
reg [N-1:0] cnt_next;

reg [2-1:0] state, state_next;
wire        tirgger;

localparam  [2-1:0] // 8 posible states
        idle     = 2'd0,
        wait1    = 2'd1,
        jump     = 2'd2,
        wait2    = 2'd3;

// body
always @(posedge clk)
	if (rst) begin
                cnt           <=  {N{1'b0}} ;
                state         <=   0 ;
        end
	else begin
		cnt           <=   cnt_next;
                state         <=   state_next ;
        end

// next-state logic 
always @*
begin
        case (state)
                idle : begin // waiting for start
                    if (start) 
                        state_next <= wait1 ;
                    else
                        state_next  <=    idle ;
                    cnt_next        <=    {N{1'b0}} ;
                end
                wait1 : begin // waiting before jump
                    if (&cnt) 
                        state_next <= jump ;
                    else
                        state_next <= wait1 ;
                    cnt_next       <=    cnt + 1 ;
                end
                jump : begin // change the state
                    state_next     <= wait2 ;
                    cnt_next       <=    {N{1'b0}} ;
                end
                wait2 : begin // keep waiting until start changes
                    if (start) 
                        state_next <= wait2 ;
                    else
                        state_next  <=    idle ;
                    cnt_next        <=    {N{1'b0}} ;
                end
                default : begin 
                    state      <= idle;
                    cnt        <= {N{1'b0}} ;
                end
        endcase
end


// output logic

assign tick = (state==jump) ;
assign out  = (state==jump)|(state==wait2) ;

endmodule
