// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`define K00 32'h428a2f98
`define K01 32'h71374491
`define K02 32'hb5c0fbcf
`define K03 32'he9b5dba5
`define K04 32'h3956c25b
`define K05 32'h59f111f1
`define K06 32'h923f82a4
`define K07 32'hab1c5ed5
`define K08 32'hd807aa98
`define K09 32'h12835b01
`define K10 32'h243185be
`define K11 32'h550c7dc3
`define K12 32'h72be5d74
`define K13 32'h80deb1fe
`define K14 32'h9bdc06a7
`define K15 32'hc19bf174
`define K16 32'he49b69c1
`define K17 32'hefbe4786
`define K18 32'h0fc19dc6
`define K19 32'h240ca1cc
`define K20 32'h2de92c6f
`define K21 32'h4a7484aa
`define K22 32'h5cb0a9dc
`define K23 32'h76f988da
`define K24 32'h983e5152
`define K25 32'ha831c66d
`define K26 32'hb00327c8
`define K27 32'hbf597fc7
`define K28 32'hc6e00bf3
`define K29 32'hd5a79147
`define K30 32'h06ca6351
`define K31 32'h14292967
`define K32 32'h27b70a85
`define K33 32'h2e1b2138
`define K34 32'h4d2c6dfc
`define K35 32'h53380d13
`define K36 32'h650a7354
`define K37 32'h766a0abb
`define K38 32'h81c2c92e
`define K39 32'h92722c85
`define K40 32'ha2bfe8a1
`define K41 32'ha81a664b
`define K42 32'hc24b8b70
`define K43 32'hc76c51a3
`define K44 32'hd192e819
`define K45 32'hd6990624
`define K46 32'hf40e3585
`define K47 32'h106aa070
`define K48 32'h19a4c116
`define K49 32'h1e376c08
`define K50 32'h2748774c
`define K51 32'h34b0bcb5
`define K52 32'h391c0cb3
`define K53 32'h4ed8aa4a
`define K54 32'h5b9cca4f
`define K55 32'h682e6ff3
`define K56 32'h748f82ee
`define K57 32'h78a5636f
`define K58 32'h84c87814
`define K59 32'h8cc70208
`define K60 32'h90befffa
`define K61 32'ha4506ceb
`define K62 32'hbef9a3f7
`define K63 32'hc67178f2

module sha_core (
input  wire         clk       , 
input  wire         rst       ,
input  wire [31:0]  SHA256_H0 ,
input  wire [31:0]  SHA256_H1 ,
input  wire [31:0]  SHA256_H2 ,
input  wire [31:0]  SHA256_H3 ,
input  wire [31:0]  SHA256_H4 ,
input  wire [31:0]  SHA256_H5 ,
input  wire [31:0]  SHA256_H6 ,
input  wire [31:0]  SHA256_H7 ,

output reg  [31:0]  A0        ,
output reg  [31:0]  A1        ,
output reg  [31:0]  A2        ,
output reg  [31:0]  E0        ,
output reg  [31:0]  E1        ,
output reg  [31:0]  E2        ,
 
input  wire         init      ,//sha core initial
input  wire         vld       ,//data input valid
input  wire [31:0]  din       ,

output reg          done      ,
output wire [255:0] hash       
) ;
                        

        reg     [6:0]   round ;
        wire    [6:0]   round_plus_1 ;
        
        reg     [31:0]  H0,H1,H2,H3,H4,H5,H6,H7 ;
        reg     [31:0]  W0,W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14 ;
        reg     [31:0]  Wt,Kt ;
        reg     [31:0]  A,B,C,D,E,F,G,H ;

        reg             busy ;
        
        wire [31:0] f1_EFG_32,f2_ABC_32,f3_A_32,f4_E_32,f5_W1_32,f6_W14_32,T1_32,T2_32 ;
        wire [31:0] next_Wt,next_E,next_A ;
        
        assign f1_EFG_32 = (E & F) ^ (~E & G) ;

        assign f2_ABC_32 = (A & B) ^ (B & C) ^ (A & C) ;
        
        assign f3_A_32 = {A[1:0],A[31:2]} ^ {A[12:0],A[31:13]} ^ {A[21:0],A[31:22]} ;
        
        assign f4_E_32 = {E[5:0],E[31:6]} ^ {E[10:0],E[31:11]} ^ {E[24:0],E[31:25]} ;
        
        assign f5_W1_32 = {W1[6:0],W1[31:7]} ^ {W1[17:0],W1[31:18]} ^ {3'b000,W1[31:3]} ;
        
        assign f6_W14_32 = {W14[16:0],W14[31:17]} ^ {W14[18:0],W14[31:19]} ^ {10'b00_0000_0000,W14[31:10]} ;
        
        
        assign T1_32 = H[31:0] + f4_E_32 + f1_EFG_32 + Kt + Wt ;
        
        assign T2_32 = f3_A_32 + f2_ABC_32 ;
        
        assign next_Wt = f6_W14_32 + W9[31:0] + f5_W1_32 + W0[31:0] ;
        assign next_E = D[31:0] + T1_32 ;
        assign next_A = T1_32 + T2_32 ;
        

        assign hash = {A,B,C,D,E,F,G,H} ;

        assign round_plus_1 = round + 1 ;

always @ ( posedge clk ) begin
	if( init ) begin
		H0 <= SHA256_H0 ;
		H1 <= SHA256_H1 ;
		H2 <= SHA256_H2 ;
		H3 <= SHA256_H3 ;
		H4 <= SHA256_H4 ;
		H5 <= SHA256_H5 ;
		H6 <= SHA256_H6 ;
		H7 <= SHA256_H7 ;
	end else if( done ) begin
		H0 <= A ;
		H1 <= B ;
		H2 <= C ;
		H3 <= D ;
		H4 <= E ;
		H5 <= F ;
		H6 <= G ;
		H7 <= H ;
	end
end	
        //------------------------------------------------------------------    
        // SHA round
        //------------------------------------------------------------------
        always @(posedge clk)
        begin
                if (rst)
                begin
                        round <= 'd0 ;
                        busy <= 'b0 ;

                        W0  <= 'b0 ;
                        W1  <= 'b0 ;
                        W2  <= 'b0 ;
                        W3  <= 'b0 ;
                        W4  <= 'b0 ;
                        W5  <= 'b0 ;
                        W6  <= 'b0 ;
                        W7  <= 'b0 ;
                        W8  <= 'b0 ;
                        W9  <= 'b0 ;
                        W10 <= 'b0 ;
                        W11 <= 'b0 ;
                        W12 <= 'b0 ;
                        W13 <= 'b0 ;
                        W14 <= 'b0 ;
                        Wt  <= 'b0 ;
                        
                        A <= 'b0 ;
                        B <= 'b0 ;
                        C <= 'b0 ;
                        D <= 'b0 ;
                        E <= 'b0 ;
                        F <= 'b0 ;
                        G <= 'b0 ;
                        H <= 'b0 ;
                end else if( init ) begin
                        A <= SHA256_H0 ;
                        B <= SHA256_H1 ;
                        C <= SHA256_H2 ;
                        D <= SHA256_H3 ;
                        E <= SHA256_H4 ;
                        F <= SHA256_H5 ;
                        G <= SHA256_H6 ;
                        H <= SHA256_H7 ;
		end else begin
                        case (round)
                        'd0:
                                if( vld ) begin
                                        W0 <= din ;
                                        Wt <= din ;
                                        busy <= 'b1 ;
                                        round <= round_plus_1 ;
                                end
                        'd1:
                                if( vld ) begin
                                        W1 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                        A0<= next_A ;
					E0<= next_E ; 
                                        round <= round_plus_1 ;
                                end
                        'd2:
                                if( vld ) begin
                                        W2 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
					A1<= next_A ;
					E1<= next_E ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd3:
                                if( vld ) begin
                                        W3 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
					A2<= next_A ;
					E2<= next_E ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd4:
                                if( vld ) begin
                                        W4 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd5:
                                if( vld ) begin
                                        W5 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd6:
                                if( vld ) begin
                                        W6 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd7:
                                if( vld ) begin
                                        W7 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd8:
                                if( vld ) begin
                                        W8 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd9:
                                if( vld ) begin
                                        W9 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd10:
                                if( vld ) begin
                                        W10 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd11:
                                if( vld ) begin
                                        W11 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd12:
                                if( vld ) begin
                                        W12 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd13:
                                if( vld ) begin
                                        W13 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd14:
                                if( vld ) begin
                                        W14 <= din ;
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd15:
                                if( vld ) begin
                                        Wt <= din ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
'd16,'d17,'d18,'d19,'d20,'d21,'d22,'d23,'d24,'d25,'d26,'d27,'d28,'d29,'d30,'d31,
'd32,'d33,'d34,'d35,'d36,'d37,'d38,'d39,'d40,'d41,'d42,'d43,'d44,'d45,'d46,'d47,
'd48,'d49,'d50,'d51,'d52,'d53,'d54,'d55,'d56,'d57,'d58,'d59,'d60,'d61,'d62,'d63:
                                begin
                                        W0  <= W1 ;
                                        W1  <= W2 ;
                                        W2  <= W3 ;
                                        W3  <= W4 ;
                                        W4  <= W5 ;
                                        W5  <= W6 ;
                                        W6  <= W7 ;
                                        W7  <= W8 ;
                                        W8  <= W9 ;
                                        W9  <= W10 ;
                                        W10 <= W11 ;
                                        W11 <= W12 ;
                                        W12 <= W13 ;
                                        W13 <= W14 ;
                                        W14 <= Wt ;
                                        Wt  <= next_Wt ;
                                        
                                        H <= G ;
                                        G <= F ;
                                        F <= E ;
                                        E <= next_E ;
                                        D <= C ;
                                        C <= B ;
                                        B <= A ;
                                        A <= next_A ;
                                                
                                        round <= round_plus_1 ;
                                end
                        'd64:
                                begin
                                        A <= next_A + H0 ;
                                        B <= A + H1 ;
                                        C <= B + H2 ;
                                        D <= C + H3 ;
                                        E <= next_E + H4 ;
                                        F <= E + H5 ;
                                        G <= F + H6 ;
                                        H <= G + H7 ;
                                        round <= 'd0 ;
                                        busy <= 'b0 ;
                                end
                        default:
                                begin
                                        round <= 'd0 ;
                                        busy <= 'b0 ;
                                end
                        endcase
                end     
        end 
        
        
        //------------------------------------------------------------------    
        // Kt generator
        //------------------------------------------------------------------    
        always @ (posedge clk)
        begin
                if (rst)
                begin
                        Kt <= 'b0 ;
                end
                else
                begin
                        case (round)
                                'd00:   if(vld) Kt <= `K00 ;
                                'd01:   if(vld) Kt <= `K01 ;
                                'd02:   if(vld) Kt <= `K02 ;
                                'd03:   if(vld) Kt <= `K03 ;
                                'd04:   if(vld) Kt <= `K04 ;
                                'd05:   if(vld) Kt <= `K05 ;
                                'd06:   if(vld) Kt <= `K06 ;
                                'd07:   if(vld) Kt <= `K07 ;
                                'd08:   if(vld) Kt <= `K08 ;
                                'd09:   if(vld) Kt <= `K09 ;
                                'd10:   if(vld) Kt <= `K10 ;
                                'd11:   if(vld) Kt <= `K11 ;
                                'd12:   if(vld) Kt <= `K12 ;
                                'd13:   if(vld) Kt <= `K13 ;
                                'd14:   if(vld) Kt <= `K14 ;
                                'd15:   if(vld) Kt <= `K15 ;
                                'd16:   Kt <= `K16 ;
                                'd17:   Kt <= `K17 ;
                                'd18:   Kt <= `K18 ;
                                'd19:   Kt <= `K19 ;
                                'd20:   Kt <= `K20 ;
                                'd21:   Kt <= `K21 ;
                                'd22:   Kt <= `K22 ;
                                'd23:   Kt <= `K23 ;
                                'd24:   Kt <= `K24 ;
                                'd25:   Kt <= `K25 ;
                                'd26:   Kt <= `K26 ;
                                'd27:   Kt <= `K27 ;
                                'd28:   Kt <= `K28 ;
                                'd29:   Kt <= `K29 ;
                                'd30:   Kt <= `K30 ;
                                'd31:   Kt <= `K31 ;
                                'd32:   Kt <= `K32 ;
                                'd33:   Kt <= `K33 ;
                                'd34:   Kt <= `K34 ;
                                'd35:   Kt <= `K35 ;
                                'd36:   Kt <= `K36 ;
                                'd37:   Kt <= `K37 ;
                                'd38:   Kt <= `K38 ;
                                'd39:   Kt <= `K39 ;
                                'd40:   Kt <= `K40 ;
                                'd41:   Kt <= `K41 ;
                                'd42:   Kt <= `K42 ;
                                'd43:   Kt <= `K43 ;
                                'd44:   Kt <= `K44 ;
                                'd45:   Kt <= `K45 ;
                                'd46:   Kt <= `K46 ;
                                'd47:   Kt <= `K47 ;
                                'd48:   Kt <= `K48 ;
                                'd49:   Kt <= `K49 ;
                                'd50:   Kt <= `K50 ;
                                'd51:   Kt <= `K51 ;
                                'd52:   Kt <= `K52 ;
                                'd53:   Kt <= `K53 ;
                                'd54:   Kt <= `K54 ;
                                'd55:   Kt <= `K55 ;
                                'd56:   Kt <= `K56 ;
                                'd57:   Kt <= `K57 ;
                                'd58:   Kt <= `K58 ;
                                'd59:   Kt <= `K59 ;
                                'd60:   Kt <= `K60 ;
                                'd61:   Kt <= `K61 ;
                                'd62:   Kt <= `K62 ;
                                'd63:   Kt <= `K63 ;
                                default:Kt <= 'd0 ;
                        endcase
                end
        end


//done 
always @ ( posedge clk ) begin
	if( rst )
		done <= 1'b0 ;
	else if( round == 7'd64 )
		done <= 1'b1 ;
	else
		done <= 1'b0 ;
end

endmodule
 
