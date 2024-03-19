module carry_lookahead_generator
# (
    parameter WIDTH = 8
)
(
    input                  carry_in,
    input  [WIDTH - 1 : 0] generate_in, propagate_in,
    output [WIDTH     : 1] carry,
    output                 group_generate, group_propagate
);
    
    //Temporary wires for the carry calculation
    wire [((WIDTH + 1) * WIDTH) / 2 - 1 : 0] p_temp, g_temp;
    wire [WIDTH - 1 : 0] c_temp, pg_temp;
    
    generate
        
        genvar i, j;
        
        for (i = 0; i <= WIDTH - 1; i = i + 1)
        begin : stage
            //Calculate carry            
            for (j = 0; j <= i; j = j + 1)
            begin : block 
                assign p_temp[((i + 1) * i) / 2 + j] = & propagate_in[i : j];
                case(j)
                	0       : assign g_temp[((i + 1) * i) / 2 + j] = generate_in[i];
                	default : assign g_temp[((i + 1) * i) / 2 + j] = p_temp[((i + 1) * i) / 2 + j] & generate_in[j - 1];
                endcase
                end
                
            assign c_temp [i] = p_temp[((i + 1) * i) / 2] & carry_in;
            assign pg_temp[i] = | g_temp[(( i + 2) * (i + 1)) / 2 - 1 : ((i + 1) * i) / 2]; 
            
            assign carry [i + 1] = pg_temp[i] | c_temp[i];

        end
    endgenerate
    
    assign group_propagate = p_temp [(WIDTH * (WIDTH - 1)) / 2];
    assign group_generate  = pg_temp[WIDTH - 1];
    
endmodule
