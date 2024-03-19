module sum_and_max
#(parameter DATA_WIDTH=8,
parameter LENGTH=10)
//note: this module is not fully parametrized and must be rewritten for different LENGTH
(
input clk,
input reset_n,
input ready,
input [2*DATA_WIDTH*LENGTH-1:0] input_data,
input [DATA_WIDTH*LENGTH-1:0] biases,
output reg [LENGTH-1:0] maxi
);

reg [2*DATA_WIDTH*LENGTH-1:0] input_plus_bias;
reg [DATA_WIDTH*LENGTH-1:0] half_max;
reg [2*DATA_WIDTH*3-1:0] three_max;
reg [2*DATA_WIDTH-1:0] maximum;
reg [4:0] half_max_reg; //we need those registers to infer the right index of the result
reg [2:0] three_max_reg;
reg [1:0] i_var;

integer ii, ij, ik;

always @(posedge clk)
begin
maxi = {LENGTH{1'b0}};
if (~reset_n) begin
input_plus_bias <= {2*DATA_WIDTH*LENGTH{1'b0}};
half_max <= {DATA_WIDTH*LENGTH{1'b0}};
three_max <= {2*DATA_WIDTH*3{1'b0}};
maximum <= {2*DATA_WIDTH{1'b0}};
half_max_reg <= 5'b00000;
three_max_reg <= 3'b000;
i_var <= 2'b11;
end
else if (ready) begin
    for (ii=0; ii<LENGTH; ii=ii+1) //sign-extended biases are added to sys array output
        input_plus_bias[2*DATA_WIDTH*ii +: 2*DATA_WIDTH] = $signed(input_data[2*DATA_WIDTH*ii +: 2*DATA_WIDTH])+{{DATA_WIDTH{biases[DATA_WIDTH*(ii+1)-1]}},biases[DATA_WIDTH*ii +: DATA_WIDTH]};
    for (ij=0; ij<5; ij=ij+1) begin //get 5 maxes from pairs
        if ($signed(input_plus_bias[2*DATA_WIDTH*2*ij +: 2*DATA_WIDTH]) > $signed(input_plus_bias[2*DATA_WIDTH*(2*ij+1) +: 2*DATA_WIDTH])) begin
            half_max [2*DATA_WIDTH*ij +: 2*DATA_WIDTH] = input_plus_bias[2*DATA_WIDTH*2*ij +: 2*DATA_WIDTH]; 
            half_max_reg[ij] = 1'b0; end
        else if ($signed(input_plus_bias[2*DATA_WIDTH*2*ij +: 2*DATA_WIDTH]) <= $signed(input_plus_bias[2*DATA_WIDTH*(2*ij+1) +: 2*DATA_WIDTH])) begin
            half_max [2*DATA_WIDTH*ij +: 2*DATA_WIDTH] = input_plus_bias[2*DATA_WIDTH*(2*ij+1) +: 2*DATA_WIDTH]; 
            half_max_reg[ij] = 1'b1; end
    end
    for (ik=0; ik<2; ik=ik+1) begin //get 3 maxes out of 5
        if ($signed(half_max[2*DATA_WIDTH*2*ik +: 2*DATA_WIDTH]) > $signed(half_max[2*DATA_WIDTH*(2*ik+1) +: 2*DATA_WIDTH])) begin
            three_max [2*DATA_WIDTH*ik +: 2*DATA_WIDTH] = half_max[2*DATA_WIDTH*2*ik +: 2*DATA_WIDTH]; 
            three_max_reg[ik] = 1'b0; end
        else if ($signed(half_max[2*DATA_WIDTH*2*ik +: 2*DATA_WIDTH]) <= $signed(half_max[2*DATA_WIDTH*(2*ik+1) +: 2*DATA_WIDTH])) begin
            three_max [2*DATA_WIDTH*ik +: 2*DATA_WIDTH] = half_max[2*DATA_WIDTH*(2*ik+1) +: 2*DATA_WIDTH];
            three_max_reg[ik] = 1'b1; end
    end
    three_max[2*DATA_WIDTH*3-1:2*DATA_WIDTH*2] = half_max[DATA_WIDTH*LENGTH-1:2*DATA_WIDTH*4]; //next module is 3-input max
    if ($signed((three_max[2*DATA_WIDTH*3-1:2*DATA_WIDTH*2] >= three_max[2*DATA_WIDTH*2-1:2*DATA_WIDTH])) && $signed((three_max[2*DATA_WIDTH*3-1:2*DATA_WIDTH*2] >= three_max[2*DATA_WIDTH-1:0]))) begin
        maximum = three_max[2*DATA_WIDTH*3-1:2*DATA_WIDTH*2]; i_var = 2'd2; end
    else if ($signed((three_max[2*DATA_WIDTH*2-1:2*DATA_WIDTH] >= three_max[2*DATA_WIDTH*3-1:2*DATA_WIDTH*2])) && $signed((three_max[2*DATA_WIDTH*2-1:2*DATA_WIDTH] >= three_max[2*DATA_WIDTH-1:0]))) begin
        maximum = three_max[2*DATA_WIDTH*2-1:2*DATA_WIDTH]; i_var = 2'd1; end
    else if ($signed((three_max[2*DATA_WIDTH-1:0] >= three_max[2*DATA_WIDTH*3-1:2*DATA_WIDTH*2])) && $signed((three_max[2*DATA_WIDTH-1:0] >= three_max[2*DATA_WIDTH*2-1:2*DATA_WIDTH]))) begin 
        maximum = three_max[2*DATA_WIDTH-1:0]; i_var = 2'd0; end
    maxi[half_max_reg[i_var*2+three_max_reg[i_var]]+4*i_var+2*three_max_reg[i_var]] = 1'b1;
end
end

endmodule