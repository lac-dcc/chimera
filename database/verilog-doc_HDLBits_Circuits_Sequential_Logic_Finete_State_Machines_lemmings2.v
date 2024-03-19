module top_module(
	input clk,
	input areset,
	input bump_left,
	input bump_right,
	input ground,
	output walk_left,
	output walk_right,
	output aaah
);

	parameter LEFT = 2'd0, LEFT_GROUND = 2'd1, RIGHT = 2'd2, RIGHT_GROUND = 2'd3;

	reg [1:0] curr_dir, next_dir;

	always @(posedge clk or posedge areset) begin
		// Freshly brainwashed Lemmings walk left.
		if (areset) begin
			curr_dir <= LEFT;
		end
		else begin
			curr_dir <= next_dir;
		end
	end

	always @(*) begin
		case (curr_dir)
			LEFT: begin
				if (ground) begin
					next_dir = bump_left ? RIGHT : LEFT;
				end
				else begin
					next_dir = LEFT_GROUND;
				end
			end
			RIGHT: begin
				if (ground) begin
					next_dir = bump_right ? LEFT : RIGHT;
				end
				else begin
					next_dir = RIGHT_GROUND;
				end
			end
			LEFT_GROUND: begin
				if (ground) begin
					next_dir = LEFT;
				end
				else begin
					next_dir = LEFT_GROUND;
				end
			end
			RIGHT_GROUND: begin
				if (ground) begin
					next_dir = RIGHT;
				end
				else begin
					next_dir = RIGHT_GROUND;
				end
			end
		endcase
	end

	assign walk_left = curr_dir == LEFT;
	assign walk_right = curr_dir == RIGHT;
	assign aaah = (curr_dir == LEFT_GROUND) || (curr_dir == RIGHT_GROUND);

endmodule
/*
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    reg [1:0]state, next_state;
    parameter [1:0]LEFT=0, RIGHT=1, FALL=3;
    
    always @(*) begin
        case (state)
            LEFT: next_state <= (bump_left) ? RIGHT : LEFT;
            RIGHT: next_state <= (bump_right) ? LEFT : RIGHT;
        endcase
    end
    
    always @(posedge clk or posedge areset) begin
        if(areset) begin
            state <= LEFT;
        end else begin
            if(ground) begin
                state <= next_state;
            end else begin
                state <= FALL;
            end
        end
        aaah <= ~ground;
    end
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);
        
endmodule
*/
