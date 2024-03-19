//////////////////////////////////////////////////////////////////////////////////
//
//
//  creates a trigger signal trig_tick when trig_in change its value. The value change
//  is chosen by a trig_sel mask. The output tick last for 2**N clock ticks
//
//
//////////////////////////////////////////////////////////////////////////////////


module trigger_input
#(parameter R=8 , N=3)
(
	input  wire clk, rst, 
	input  wire [R-1:0] trig_in,   // input for trigger signals
        input  wire [R-1:0] trig_sel,  // trigger selection
	output wire         trig_tick  // output tick
);

//signal declaration
reg [N-1:0] cnt;
reg [N-1:0] cnt_next;

reg [2-1:0] state, state_next;
reg         tirgger_now, tirgger_last;

localparam  [2-1:0] // 8 posible states
        idle     = 2'd0,
        wait1    = 2'd1;

// body
always @(posedge clk)
	if (rst) begin
                cnt           <=  {N{1'b0}} ;
                state         <=   0 ;
                tirgger_now   <=   0 ;
                tirgger_last  <=   0 ;
        end
	else begin
		cnt           <=   cnt_next;
                state         <=   state_next ;
                tirgger_now   <=   |(trig_in & trig_sel) ;
                tirgger_last  <=   tirgger_now ;
        end

// next-state logic 
always @*
begin
        if(state==idle) begin
                if( {tirgger_now,tirgger_last}==2'b10) begin
                       state_next = wait1;
                       cnt_next   = { {N-1{1'b0}}  , 1'b1 };
                end
                else begin
                       state_next = idle ;
                       cnt_next   = {N{1'b0}};
                end
        end
        else begin
                if( &cnt  ) begin
                       state_next = idle ;
                       cnt_next   = {N{1'b0}};
                end
                else begin
                       state_next = wait1;
                       cnt_next   = cnt + 1'b1 ;
                end
        end
end


// output logic

assign trig_tick = (state==wait1) ;


endmodule
