// This program was cloned from: https://github.com/SriraamVS/ML-based-estimation-of-NoC-topologies-using-resource-utilization
// License: MIT License

module fattree_nca_random_up_routing  #(
   parameter K   = 64, // number of last level individual router`s endpoints.
   parameter L   = 64 // Fattree layer number (The height of FT) 
)
(
    reset,
    clk,
    current_addr_encoded,    // connected to current router x address
    current_level,    //connected to current router y address
    dest_addr_encoded,        // destination address
    destport_encoded    // router output port
 
);
 
 
    function integer log2;
      input integer number; begin   
         log2=(number <=1) ? 1: 0;    
         while(2**log2<number) begin    
            log2=log2+1;    
         end        
      end   
    endfunction // log2 
 
 
    localparam
        Kw = log2(K),
        LKw= L*Kw,
        Lw = log2(L);
 
 
 
    input reset,clk;
    input  [LKw-1 :0]    current_addr_encoded;
    input  [Lw-1  :0]    current_level;    
    input  [LKw-1 :0]    dest_addr_encoded;
    output [K :0]    destport_encoded;
    /**
        destport_encoded format in fat tree. K+1 bit
        destport[K] 
            1'b0  : go down 
            1'b1  : go up
        destport[K-1: 0]: 
            onehot coded. asserted bit show the output port locatation     
    ***/
 
 
 
    wire  [Kw-1 :0]  current_addr [L-1 : 0];
    wire  [Kw-1 :0]  parrent_dest_addr [L-1 : 0];
    wire  [Kw-1 :0]  dest_addr [L-1 : 0];
    wire  [Kw-1 :0]  current_node_dest_port;
 
    wire [L-1 : 0] parrents_node_missmatch; 
 
    wire [K-1 : 0] counter; // a one hot counter. The value of the counter is used as a random destination port number when going to the up ports
 
     pronoc_register #(
           .W(K),
           .RESET_TO(1)
      ) reg1 ( 
           .in({counter[0],counter[K-1:1]}),
           .reset(reset),    
           .clk(clk),      
           .out(counter)
      );
 
 
 
 
 
    assign current_addr [0]={Kw{1'b0}}; 
    assign parrent_dest_addr [0]={Kw{1'b0}}; 
 
    genvar i;
    generate 
    for(i=1; i<L; i=i+1)begin : caddr
        /* verilator lint_off WIDTH */ 
        assign current_addr [i] = (current_level <i)? current_addr_encoded[i*Kw-1 : (i-1)*Kw] : {Kw{1'b0}};
        assign parrent_dest_addr [i] = (current_level<i)? dest_addr_encoded[(i+1)*Kw-1 : i*Kw] : {Kw{1'b0}};
        /* verilator lint_on WIDTH */ 
    end
 
 
    for(i=0; i<L; i=i+1) begin : daddr
       // assign current_addr [i] = (current_level >=i)? current_addr_encoded[(i+1)*Kw-1 : i*Kw] : {Kw{1'b0}};
 
        assign dest_addr [i] =  dest_addr_encoded[(i+1)*Kw-1 : i*Kw];
        assign parrents_node_missmatch[i]=  current_addr [i] !=  parrent_dest_addr [i]; 
    end//for
    endgenerate
 
   assign current_node_dest_port = dest_addr[current_level];
   wire [K-1:0] current_node_dest_port_one_hot;
 
   bin_to_one_hot #(
    .BIN_WIDTH(Kw),
    .ONE_HOT_WIDTH(K)
   )
   conv
   (
    .bin_code(current_node_dest_port),
    .one_hot_code(current_node_dest_port_one_hot)
   ); 
 
    assign destport_encoded = (parrents_node_missmatch != {L{1'b0}}) ? {1'b1,counter} : {1'b0,current_node_dest_port_one_hot};
 
endmodule
