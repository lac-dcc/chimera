module check_byte(
    input   [7:0]data_in,
    input   [1:0]tlp_or_dllp_in, 
    input   valid,
    input   DK,

    output  [5:0]type,
    output  [1:0]tlp_or_dllp_out
);
// data boundries
    localparam STP = 8'b111_11011 ;
    localparam SDP = 8'b010_11100 ;
    localparam END = 8'b111_11101 ;
    localparam EDB = 8'b111_11110 ;
    localparam PAD = 8'b111_10111;

// types
    localparam data       = 6'b100_000;
    localparam  not_valid = 6'b000_000;
    localparam tlpstart   = 6'b010_000;
    localparam tlpend     = 6'b001_000;
    localparam dllpend    = 6'b000_100;
    localparam dllpstart  = 6'b000_010;
    localparam tlpedb     = 6'b000_001;
// 
    localparam tlp = 2'b01;
    localparam dllp = 2'b10;
    localparam not_valid_data = 2'b00 ;
   
    reg[5:0] type_reg;    
    reg [1:0]tlp_or_dllp_out_reg;

    reg [1:0]tlp_or_dllp_in_reg;

    always @*
    begin
        tlp_or_dllp_out_reg=tlp_or_dllp_in;
        type_reg=not_valid;  
        if(valid)begin
            if(DK)
            begin
              case (data_in)
            SDP:begin
                tlp_or_dllp_out_reg = dllp;
                type_reg = dllpstart;

                
            end 
            STP:begin
                    tlp_or_dllp_out_reg = tlp;  
                    type_reg = tlpstart;
                end
        
            END:begin
                if (tlp_or_dllp_in == dllp)
                    begin
                        tlp_or_dllp_out_reg = not_valid_data;
                        type_reg = dllpend;
                    end
                 if (tlp_or_dllp_in == tlp) begin
                    tlp_or_dllp_out_reg = not_valid_data;
                    type_reg = tlpend;     
                 end
                end    
            
           
            EDB: begin
                type_reg = tlpedb ;
                tlp_or_dllp_out_reg = not_valid_data;
                end             
        
            default:type_reg = not_valid; 
              endcase  
            end
            else 
            begin
              if(tlp_or_dllp_in != not_valid_data)begin 
               type_reg=data;
              end 
              
            end
        end
    end

assign type = type_reg;
assign tlp_or_dllp_out = tlp_or_dllp_out_reg;

endmodule

