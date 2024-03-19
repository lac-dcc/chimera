
module Gen_3_check_byte(
    input   [7:0]data_in,
    input   valid,
    input   [11:0]byte_count_in,
    input   [2:0]byte_header_in,
    input   [11:0]count_limit_in,
    input   [1:0]syncHeader,
    input rst,
    output   [5:0]type,
    output   [11:0]byte_count_out,
    output   [2:0]byte_header_out,
    output   [11:0]count_limit_out
                
);
// data boundries
    localparam STP = 4'b1111 ;

    localparam SDP_byte1 = 8'b1111_0000;
    localparam SDP_byte2 = 8'b1010_1100 ;
    
    // localparam END_byte1 = 8'b0001_1111 ;
    // localparam END_byte2 = 8'b0000_0000 ;
    // localparam END_byte3 = 8'b1001_0000 ;
    // localparam END_byte4 = 8'b0000_0000 ;
    
    // localparam EDB_byte1 = 8'b1100_0000 ;
    // localparam EDB_byte2 = 8'b1100_0000 ;
    // localparam EDB_byte3 = 8'b111_11110 ;
    // localparam EDB_byte4 = 8'b111_11110 ; 
    
    // byte type
    localparam not_header =3'b000;
    localparam sdp1 = 3'b001;
    localparam sdp2 = 3'b010;
    localparam stp1 = 3'b011;
    localparam stp2 = 3'b100;
    localparam stp3 = 3'b101;
    localparam stp4 = 3'b111;
    localparam edb1 = 3'b110;

// types
    localparam data       = 6'b100_000;
    localparam not_valid  = 6'b000_000;
    localparam tlpstart   = 6'b010_000;
    localparam tlpend     = 6'b001_000;
    localparam dllpend    = 6'b000_100;
    localparam dllpstart  = 6'b000_010;
    localparam tlpedb     = 6'b000_001;

reg   [11:0]byte_count_in_reg;
reg   [2:0]byte_header_in_reg;
reg   [11:0]count_limit_in_reg;
reg   [5:0]type_reg;

always @(*) begin
    byte_count_in_reg = byte_count_in;
    byte_header_in_reg = byte_header_in;
    count_limit_in_reg = count_limit_in;
    type_reg = not_valid;
    if(!rst)
    begin
        byte_count_in_reg = 0;
        byte_header_in_reg= 0;
        count_limit_in_reg= 0;    
    end
    else
    begin
     
        if(valid  & (syncHeader == 2'b01))
        begin
           if(data_in == SDP_byte1 & byte_header_in == 2'b00)
        begin
            byte_header_in_reg = sdp1;
        end
        else if ((data_in == SDP_byte2) & (byte_header_in == sdp1) ) 
        begin
            // count = 0
            count_limit_in_reg = 12'd6;
            byte_count_in_reg = 12'd0;
            // type SDP
            type_reg = dllpstart;
            byte_header_in_reg = sdp2;
            // 
        end
        
        if(data_in[3:0] == STP  & byte_header_in == 2'b00)
            begin
                byte_header_in_reg = stp1;
                count_limit_in_reg[3:0] = data_in[7:4];
            end
            else if (byte_header_in == stp1) 
            begin
                byte_header_in_reg = stp2;
                count_limit_in_reg[11:4] = data_in;
                // 
            end
            else if (byte_header_in == stp2) 
            begin
                byte_header_in_reg = stp3;
                count_limit_in_reg = count_limit_in_reg << 2;
                // 
            end
            else if (byte_header_in == stp3) 
            begin
                byte_count_in_reg = 12'd0;
                // type SDP
                type_reg = tlpstart;
               
                byte_header_in_reg = stp4;
                // 
            end
         if((byte_count_in < count_limit_in) && (byte_header_in == stp4))
        begin
            
            byte_count_in_reg = byte_count_in_reg + 1;
            type_reg = data;
        end
        else if((byte_count_in ==count_limit_in) & (byte_header_in == stp4))
        begin

            count_limit_in_reg = 0;
            byte_count_in_reg = 0;
            byte_header_in_reg = 0;
            if(data_in ==8'b1100_0000)
                type_reg = tlpedb;
            else   
                type_reg = tlpend;
        end 

        if((byte_count_in < count_limit_in) && (byte_header_in == sdp2))
        begin
            
            byte_count_in_reg = byte_count_in_reg + 1;
            type_reg = data;
        end
        else if((byte_count_in == 6) & (byte_header_in == sdp2))
        begin

            count_limit_in_reg = 0;
            byte_count_in_reg = 0;
            byte_header_in_reg = 0;
            type_reg = dllpend;

        end  

        end
    end
   
    
end


assign byte_count_out = byte_count_in_reg;
assign byte_header_out = byte_header_in_reg;
assign count_limit_out = count_limit_in_reg;
assign type = type_reg;

endmodule