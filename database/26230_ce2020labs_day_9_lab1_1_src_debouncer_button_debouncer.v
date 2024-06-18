// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module button_debouncer
#( parameter DEBOUNCE_TIMER = 10
)
(
	input clk, reset,
	input [3:0] RAW_BTN,
	output [3:0] BTN,
	output [3:0] BTN_POSEDGE,
	output [3:0] BTN_NEGEDGE
);

reg [3:0] states_of_button_0, states_of_button_1, states_of_button_2,states_of_button_3;
reg [DEBOUNCE_TIMER:0] counter [3:0];
wire [3:0] state_changed;
//wire [1:0] key_states_0, key_states_1, key_states_2, key_states_3;

//fetching raw button state
always@(posedge clk) begin
states_of_button_0[1:0]<= {states_of_button_0[0],RAW_BTN[0]};
states_of_button_1[1:0]<= {states_of_button_1[0],RAW_BTN[1]};
states_of_button_2[1:0]<= {states_of_button_2[0],RAW_BTN[2]};
states_of_button_3[1:0]<= {states_of_button_3[0],RAW_BTN[3]};
end

//waiting bounce to finish
always@(posedge clk) begin
if(reset) begin
counter[0]<=0;
counter[1]<=0;
counter[2]<=0;
counter[3]<=0;
end else begin
if(!state_changed[0]) counter[0]<=counter[0]+1;
else if(state_changed[0]) counter[0]<=0;

if(!state_changed[1]) counter[1]<=counter[1]+1;
else if(state_changed[1]) counter[1]<=0;

if(!state_changed[2]) counter[2]<=counter[2]+1;
else if(state_changed[2]) counter[2]<=0;

if(!state_changed[3]) counter[3]<=counter[3]+1;
else if(state_changed[3]) counter[3]<=0;
end
end

//fetching debounced state
always@(posedge clk) begin
if(&counter[0]) states_of_button_0[2]<= states_of_button_0[1];
if(&counter[1]) states_of_button_1[2]<= states_of_button_1[1];
if(&counter[2]) states_of_button_2[2]<= states_of_button_2[1];
if(&counter[3])states_of_button_3[2]<= states_of_button_3[1];
end

//fetching debounced posedge or negedge
always@(posedge clk) begin
states_of_button_0[3]<=states_of_button_0[2];
states_of_button_1[3]<=states_of_button_1[2];
states_of_button_2[3]<=states_of_button_2[2];
states_of_button_3[3]<=states_of_button_3[2];
end

//assign key_states_0={states_of_button_0[2],states_of_button_0[1]};
//assign key_states_1={states_of_button_1[2],states_of_button_1[1]};
//assign key_states_2={states_of_button_2[2],states_of_button_2[1]};
//assign key_states_3={states_of_button_0[2],states_of_button_3[1]};

assign state_changed[0] = (states_of_button_0[1]!=states_of_button_0[0]);
assign state_changed[1] = (states_of_button_1[1]!=states_of_button_1[0]);
assign state_changed[2] = (states_of_button_2[1]!=states_of_button_2[0]);
assign state_changed[3] = (states_of_button_3[1]!=states_of_button_3[0]);

assign BTN[0] = states_of_button_0[2];
assign BTN[1] = states_of_button_1[2];
assign BTN[2] = states_of_button_2[2];
assign BTN[3] = states_of_button_3[2];

assign BTN_POSEDGE[0] = ~states_of_button_0[3]&states_of_button_0[2];
assign BTN_POSEDGE[1] = ~states_of_button_1[3]&states_of_button_1[2];
assign BTN_POSEDGE[2] = ~states_of_button_2[3]&states_of_button_2[2];
assign BTN_POSEDGE[3] = ~states_of_button_3[3]&states_of_button_3[2];

assign BTN_NEGEDGE[0] = states_of_button_0[3]&~states_of_button_0[2];
assign BTN_NEGEDGE[1] = states_of_button_1[3]&~states_of_button_1[2];
assign BTN_NEGEDGE[2] = states_of_button_2[3]&~states_of_button_2[2];
assign BTN_NEGEDGE[3] = states_of_button_3[3]&~states_of_button_3[2];

endmodule