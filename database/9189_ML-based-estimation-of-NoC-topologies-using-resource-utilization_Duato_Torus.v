// This program was cloned from: https://github.com/SriraamVS/ML-based-estimation-of-NoC-topologies-using-resource-utilization
// License: MIT License

module tranc_duato_routing #(
        parameter NX  =   64,
        parameter NY  =   64
    )
    (       
        current_x,  // current router x address
        current_y,  // current router y address
        dest_x,     // destination x address
        dest_y,     // destination y address
        destport    // router output port
 
 
    );
 
 
 
 
    function integer log2;
      input integer number; begin   
         log2=(number <=1) ? 1: 0;    
         while(2**log2<number) begin    
            log2=log2+1;    
         end        
      end   
    endfunction //log2 
 
 
    localparam  P   =   5,
                P_1 =   P-1,
                Xw  =   log2(NX),
                Yw  =   log2(NY);
 
    input  [Xw-1        :0] current_x;
    input  [Yw-1        :0] current_y;
    input  [Xw-1        :0] dest_x;
    input  [Yw-1        :0] dest_y;
    output [P_1-1       :0] destport;
 
 
 
    localparam LOCAL=   3'd0;  
    localparam EAST =   3'd1; 
    localparam NORTH=   3'd2;  
    localparam WEST =   3'd3;  
    localparam SOUTH=   3'd4;  
 
 
    wire tranc_x_plus,tranc_y_plus,tranc_x_min,tranc_y_min;
    wire same_x,same_y;
 
 
    tranc_dir #(
        .NX(NX),
        .NY(NY)
    )
    tranc_dir(
        .tranc_x_plus(tranc_x_plus),
        .tranc_x_min(tranc_x_min),
        .tranc_y_plus(tranc_y_plus),
        .tranc_y_min(tranc_y_min),
        .same_x(same_x),
        .same_y(same_y),
        .current_x(current_x),
        .current_y(current_y),
        .dest_x(dest_x),
        .dest_y(dest_y)
 
    );
 
 
    reg [P-1    :    0]    possible_out_port;
 
 
    always @(*)begin     
        possible_out_port         = 5'd0;
        if(same_x &&  same_y) begin 
            possible_out_port [LOCAL]=1'b1;
        end
        else if (tranc_x_min && tranc_y_min) begin 
            possible_out_port     [WEST]= 1'b1;
            possible_out_port     [NORTH]= 1'b1;
        end 
        else if (tranc_x_min && tranc_y_plus) begin 
            possible_out_port     [WEST]= 1'b1;
            possible_out_port     [SOUTH]= 1'b1;
        end 
        else if (tranc_x_min &&    same_y) begin 
            possible_out_port     [WEST]= 1'b1;
        end
        else if (tranc_x_plus &&  tranc_y_min) begin 
            possible_out_port     [EAST]= 1'b1;
            possible_out_port     [NORTH]= 1'b1;
 
        end
        else if (tranc_x_plus &&  tranc_y_plus) begin 
            possible_out_port     [EAST]= 1'b1;
            possible_out_port     [SOUTH]= 1'b1;
        end
        else if (tranc_x_plus && same_y) begin 
            possible_out_port     [EAST]= 1'b1;
        end
        else if (same_x && tranc_y_min) begin 
            possible_out_port     [NORTH]= 1'b1;
        end
        else if (same_x && tranc_y_plus) begin 
            possible_out_port     [SOUTH]= 1'b1;
        end
    end
 
    // code the destination port
    wire x,y,a,b;
    assign x = tranc_x_plus;
    assign y = tranc_y_plus;
    assign a = possible_out_port[EAST] | possible_out_port[WEST]; 
    assign b = possible_out_port[NORTH]| possible_out_port[SOUTH];
    assign destport = {x,y,a,b};
 
 endmodule

