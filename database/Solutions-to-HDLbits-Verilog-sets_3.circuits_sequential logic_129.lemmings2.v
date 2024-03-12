module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

	localparam [1:0] WALK_L = 2'b00,
					 WALK_R = 2'b01,
					 FALL_L = 2'b10,
 					 FALL_R = 2'b11;

 	reg [1:0] state, next;

 	always @(posedge clk or posedge areset) begin
 		if(areset) state <= WALK_L;
 		else begin
 			state <= next;
 		end
 	end

 	always @(*) begin
 		case(state)
 			WALK_L : next = (ground == 0) ? FALL_L : ((bump_left == 1) ? WALK_R : WALK_L);
 			WALK_R : next = (ground == 0) ? FALL_R : ((bump_right == 1) ? WALK_L : WALK_R);
 			FALL_L : next = (ground == 1) ? WALK_L : FALL_L;
 			FALL_R : next = (ground == 1) ? WALK_R : FALL_R;
 		endcase
 	end

 	assign walk_left = (state == WALK_L);
 	assign walk_right = (state == WALK_R);
 	assign aaah = ((state == FALL_L) || (state == FALL_R));

endmodule
