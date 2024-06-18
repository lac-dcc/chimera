// This program was cloned from: https://github.com/SriraamVS/ML-based-estimation-of-NoC-topologies-using-resource-utilization
// License: MIT License

module  adaptive_look_ahead_routing #(
    parameter P         =5,
    parameter NX        =64,
    parameter NY        =64,
    parameter TOPOLOGY  ="MESH",//"MESH","TORUS"
    parameter ROUTE_NAME="WEST_FIRST",
    parameter ROUTE_TYPE="DETERMINISTIC"
  )
  (
        current_x,  //current router x address
        current_y,  //current router y address
        dest_x,  // destination router x address          
        dest_y,  // destination router y address                  
        destport_encoded,   // current router destination port      
        lkdestport_encoded // look ahead destination port 
 
 );
 
 
    function integer log2;
      input integer number; begin   
         log2=(number <=1) ? 1: 0;    
         while(2**log2<number) begin    
            log2=log2+1;    
         end        
      end   
    endfunction // log2 
 
 
    localparam  P_1     =   P-1,
                Xw      =   log2(NX),   // number of node in x axis
                Yw      =   log2(NY);    // number of node in y axis
 
 
    input   [Xw-1   :   0]  current_x;
    input   [Yw-1   :   0]  current_y;                  
    input   [Xw-1   :   0]  dest_x;
    input   [Yw-1   :   0]  dest_y;
    input   [P_1-1  :   0]  destport_encoded;
    output  [P_1-1  :   0]  lkdestport_encoded;
 
 /*
 destination-port coded
            x:  1 EAST, 0 WEST  
            y:  1 NORTH, 0 SOUTH
            ab: 00 : LOCAL, 10: xdir, 01: ydir, 11 x&y dir 
 
*/
 
 
 
    wire x,y,a,b;
    wire    [Xw-1   :   0]  next_x;
    wire    [Yw-1   :   0]  next_y; 
    wire    [P_1-1  :   0]  lkdestport_x,lkdestport_y;
    reg     [P-1    :   0]  destport_x, destport_y;
 
    assign {x,y,a,b} = destport_encoded;
 
   always @(*)begin 
        destport_x = 5'd0;
        destport_y = 5'd0;
        case({a,b})
            2'b10 : destport_x = {1'b0,~x,1'b0,x,1'b0};
            2'b01 : destport_y = {~y,1'b0,y,1'b0,1'b0};
            2'b11 : begin destport_x = {1'b0,~x,1'b0,x,1'b0}; destport_y = {~y,1'b0,y,1'b0,1'b0}; end
            2'b00 : begin destport_x =  5'b00001;destport_y =  5'b00001; end 
         endcase
   end //always
 
    mesh_torus_next_router_addr_predictor #(
        .P(P),
        .TOPOLOGY(TOPOLOGY),
        .NX(NX),
        .NY(NY)
    )
    addr_predictor_x
    (
        .destport(destport_x),
        .current_x(current_x),
        .current_y(current_y),
        .next_x(next_x),
        .next_y()
    );
 
 
     mesh_torus_next_router_addr_predictor #(
        .P(P),
        .TOPOLOGY(TOPOLOGY),
        .NX(NX),
        .NY(NY)
    )
    addr_predictor_y
    (
        .destport(destport_y),
        .current_x(current_x),
        .current_y(current_y),
        .next_x(),
        .next_y(next_y)
    );
 
 
 
    mesh_torus_conventional_routing #(
        .TOPOLOGY(TOPOLOGY),
        .ROUTE_NAME(ROUTE_NAME),
        .ROUTE_TYPE(ROUTE_TYPE),
        .NX(NX),
        .NY(NY),
        .LOCATED_IN_NI(0)
    )
    conv_route_x
    (
        .current_x(next_x),
        .current_y(current_y),
        .dest_x(dest_x),
        .dest_y(dest_y),
        .destport(lkdestport_x)
    );
 
    mesh_torus_conventional_routing #(
        .TOPOLOGY(TOPOLOGY),
        .ROUTE_NAME(ROUTE_NAME),
        .ROUTE_TYPE(ROUTE_TYPE),
        .NX(NX),
        .NY(NY),
        .LOCATED_IN_NI(0)
    )
    conv_route_y
    (
        .current_x(current_x),
        .current_y(next_y),
        .dest_x(dest_x),
        .dest_y(dest_y),
        .destport(lkdestport_y)
    );
 //take the value of a&b only.  x&y can be obtained from destport in the router
 assign lkdestport_encoded = {lkdestport_x[1:0],lkdestport_y[1:0]};
 
 
 endmodule
