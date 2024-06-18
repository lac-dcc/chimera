// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

`timescale 1ns/10ps

module control_unit (
    input clk,
    input reset,
    input stop,
    input con_ff,
    input [31:0] ir,

    output reg inport_out,
    output reg read,
    output reg ram_write,
    // operations

    // signals
    output reg hi_enable,
    output reg lo_enable,
    output reg con_enable,
    output reg pc_enable,
    output reg ir_enable,
    output reg y_enable,
    output reg z_enable,
    output reg mar_enable,
    output reg mdr_enable,
    output reg outport_enable,
    output reg c_sign_extended_out, // cout?
    output reg ba_out,

    output reg gra,
    output reg grb,
    output reg grc,
    output reg r_in,
    output reg r_out,
    output reg hi_out,
    output reg lo_out,
    output reg zhi_out,
    output reg zlo_out,
    output reg mdr_out,
    output reg pc_out,

    output reg pc_increment,
    output reg y_clr,
    output reg ir_clr,
    output reg clr,
    output reg r15_enable
);

// Opcodes for operations
localparam ld_opcode = 5'b00000;
localparam ldi_opcode = 5'b00001;
localparam st_opcode = 5'b00010;
localparam add_opcode = 5'b00011;
localparam sub_opcode = 5'b00100;
localparam shr_opcode = 5'b00101;
localparam shra_opcode = 5'b00110;
localparam shl_opcode = 5'b00111;
localparam ror_opcode = 5'b01000;
localparam rol_opcode = 5'b01001;
localparam and_opcode = 5'b01010;
localparam or_opcode = 5'b01011;
localparam addi_opcode = 5'b01100;
localparam andi_opcode = 5'b01101;
localparam ori_opcode = 5'b01110;
localparam mul_opcode = 5'b01111;
localparam div_opcode = 5'b10000;
localparam neg_opcode = 5'b10001;
localparam not_opcode = 5'b10010;
localparam branch_opcode = 5'b10011;
localparam jr_opcode = 5'b10100;
localparam jal_opcode = 5'b10101;
localparam in_opcode = 5'b10110;
localparam out_opcode = 5'b10111;
localparam mfhi_opcode = 5'b11000;
localparam mflo_opcode = 5'b11001;
localparam nop_opcode = 5'b11010;
// localparam in_opcode = 5'b10110;
// localparam out_opcode = 5'b10111;

// FSM signals
parameter reset_state = 6'b000000;
parameter fetch0 = 6'b000001;
parameter fetch1 = 6'b000010;
parameter fetch2 = 6'b000011;
parameter ld3 = 6'b000100;            // ld
parameter ld4 = 6'b000101;
parameter ld5 = 6'b000110;
parameter ld6 = 6'b000111;
parameter ld7 = 6'b001000;
parameter ldi3 = 6'b001001;           // ldi
parameter ldi4 = 6'b001010;
parameter ldi5 = 6'b001011;
parameter br3 = 6'b001100;            // br
parameter br4 = 6'b001101;
parameter br5 = 6'b001110;
parameter br6 = 6'b001111;
parameter nop3 = 6'b010000;           // nop
parameter add_sub3 = 6'b010001;           // add
parameter add_sub4 = 6'b010010;
parameter add_sub5 = 6'b010011;
parameter addi_andi_ori3 = 6'b010100;          // addi, andi & ori
parameter addi_andi_ori4 = 6'b010101;
parameter addi_andi_ori5 = 6'b010110;
parameter neg_not3 = 6'b010111;           // neg & not
parameter neg_not4 = 6'b011000;
parameter andi3 = 6'b011001;          // andi
parameter andi4 = 6'b011010;
parameter ror_rol3 = 6'b011011;      // ror & rol
parameter ror_rol4 = 6'b011100;
parameter ror_rol5 = 6'b011101;
parameter sh3 = 6'b011110;           // shra, shr & shl
parameter sh4 = 6'b011111;
parameter sh5 = 6'b100000;
parameter st3 = 6'b100001;           // st
parameter st4 = 6'b100010;
parameter st5 = 6'b100011;
parameter st6 = 6'b100100;
parameter st7 = 6'b100101;
parameter and_or3 = 6'b100110;       // and & or
parameter and_or4 = 6'b100111;
parameter and_or5 = 6'b101000;
parameter mul3 = 6'b101001;          // mul
parameter mul4 = 6'b101010;
parameter mul5 = 6'b101011;
parameter mul6 = 6'b101100;
parameter mfhi3 = 6'b101101;         // mfhi
parameter mflo3 = 6'b101110;         // mflo
parameter div3 = 6'b101111;          // div
parameter div4 = 6'b110000;
parameter div5 = 6'b110001;
parameter div6 = 6'b110010;
parameter jal3 = 6'b110011;          // jal
parameter jal4 = 6'b110100;
parameter jr3 = 6'b110101;           // jr
parameter in3 = 6'b110110;           // in
parameter out3 = 6'b110111;          // out



reg [5:0] present_state = reset_state;


reg toggle = 0; // Initialize the toggle flip-flop
always @(posedge clk, posedge reset) begin
    if (reset == 1'b1) begin
        present_state <= reset_state; 
        toggle <= 0; // Reset the toggle to 0 on reset
    end
    else begin
        toggle <= ~toggle; // Toggle the flip-flop on each clock edge
        if (toggle) begin // Proceed with state transitions only when toggle is high
            case (present_state)
                reset_state: present_state <= fetch0;
                fetch0: present_state <= fetch1;
                fetch1: present_state <= fetch2;
                fetch2: begin 
                    case (ir[31:27])
                        ld_opcode:      present_state <= ld3;
                        ldi_opcode:     present_state <= ldi3;
                        branch_opcode:  present_state <= br3;
                        nop_opcode:     present_state <= nop3;
                        add_opcode:     present_state <= add_sub3;
                        sub_opcode:     present_state <= add_sub3;
                        addi_opcode:    present_state <= addi_andi_ori3;
                        andi_opcode:    present_state <= addi_andi_ori3;
                        ori_opcode:     present_state <= addi_andi_ori3;
                        neg_opcode:     present_state <= neg_not3;
                        not_opcode:     present_state <= neg_not3;
                        ror_opcode:     present_state <= ror_rol3;
                        rol_opcode:     present_state <= ror_rol3;
                        shra_opcode:    present_state <= sh3;
                        shr_opcode:     present_state <= sh3;
                        shl_opcode:     present_state <= sh3;
                        st_opcode:      present_state <= st3;
                        and_opcode:     present_state <= and_or3;
                        or_opcode:      present_state <= and_or3;
                        mul_opcode:     present_state <= mul3;
                        div_opcode:     present_state <= div3;
                        mfhi_opcode:    present_state <= mfhi3;
                        mflo_opcode:    present_state <= mflo3;
                        jal_opcode:     present_state <= jal3;
                        jr_opcode:      present_state <= jr3;
                        in_opcode:      present_state <= in3;
                        out_opcode:     present_state <= out3;
                        // TODO: Additional opcodes

                    endcase
                end
                // Continue with other states as before
                // ld
                ld3: present_state <= ld4;
                ld4: present_state <= ld5;
                ld5: present_state <= ld6;
                ld6: present_state <= ld7;
                ld7: present_state <= fetch0;
                // ldi
                ldi3: present_state <= ldi4;
                ldi4: present_state <= ldi5;
                ldi5: present_state <= fetch0;
                // br
                br3: present_state <= br4;
                br4: present_state <= br5;
                br5: present_state <= br6;
                br6: present_state <= fetch0;
                // nop
                nop3: present_state <= fetch0;
                // add
                add_sub3: present_state <= add_sub4;
                add_sub4: present_state <= add_sub5;
                add_sub5: present_state <= fetch0;
                // addi, andi & ori
                addi_andi_ori3: present_state <= addi_andi_ori4;
                addi_andi_ori4: present_state <= addi_andi_ori5;
                addi_andi_ori5: present_state <= fetch0;
                // neg
                neg_not3: present_state <= neg_not4;
                neg_not4: present_state <= fetch0;
                // rol & ror
                ror_rol3: present_state <= ror_rol4;
                ror_rol4: present_state <= ror_rol5;
                ror_rol5: present_state <= fetch0;
                // shra, shr & shl
                sh3: present_state <= sh4;
                sh4: present_state <= sh5;
                sh5: present_state <= fetch0;
                // st
                st3: present_state <= st4;
                st4: present_state <= st5;
                st5: present_state <= st6;
                st6: present_state <= st7;
                st7: present_state <= fetch0;
                // and & or
                and_or3: present_state <= and_or4;
                and_or4: present_state <= and_or5;
                and_or5: present_state <= fetch0;
                // mul
                mul3: present_state <= mul4;
                mul4: present_state <= mul5;
                mul5: present_state <= mul6;
                mul6: present_state <= fetch0;
                // div
                div3: present_state <= div4;
                div4: present_state <= div5;
                div5: present_state <= div6;
                div6: present_state <= fetch0;
                // mfhi
                mfhi3: present_state <= fetch0;
                // mflo
                mflo3: present_state <= fetch0;
                // jal
                jal3: present_state <= jal4;
                jal4: present_state <= fetch0;
                // jr
                jr3: present_state <= fetch0;
                // in
                in3: present_state <= fetch0;
                // out
                out3: present_state <= fetch0;
                // TODO: FILL IN PRESENT STATES EX: add_sub3: present_state <= add_sub4;
                // Make sure to use non-blocking assignments (<=) within always blocks
            endcase
        end
        // When toggle is low, do not change the present_state
    end
end


always @(present_state)
begin
    case(present_state)
        reset_state: begin
            clr = 1;
            inport_out = 0;
            read = 0;
            ram_write = 0;
            hi_enable = 0;
            lo_enable = 0;
            con_enable = 0;
            pc_enable = 0;
            ir_enable = 0;
            y_enable = 0;
            z_enable = 0;
            mar_enable = 0;
            mdr_enable = 0;
            outport_enable = 0;
            c_sign_extended_out = 0;
            ba_out = 0;
            gra = 0;
            grb = 0;
            grc = 0;
            r_in = 0;
            r_out = 0;
            hi_out = 0;
            lo_out = 0;
            zhi_out = 0;
            zlo_out = 0;
            mdr_out = 0;
            pc_out = 0;
            #20 clr = 0;
        end
		fetch0: begin
			pc_out <= 1; mar_enable <= 1; pc_increment <= 1; ir_clr <= 1; y_clr <= 1; //ir_clr???? maybe add y_clr too
			#20 mar_enable <= 0; pc_increment <= 0; ir_clr <= 0; y_clr <= 0; z_enable <= 1; //ir_clr????
			#20 pc_out <= 0; z_enable <= 0;
		end
		fetch1: begin
			read <= 1; mdr_enable <= 1; pc_enable <= 1; zlo_out <= 1;
			#20 read <= 0; mdr_enable <= 0; pc_enable <= 0; zlo_out <= 0;
		end
		fetch2: begin
			mdr_out <= 1; ir_enable <= 1;
			#20 mdr_out<= 0; ir_enable <= 0;
		end

        // ld instruction
        ld3: begin
			grb <= 1; ba_out <= 1; y_enable <= 1;
			#20 grb <= 0; ba_out <= 0; y_enable <= 0;
		end
		ld4: begin
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end
		ld5: begin
			zlo_out <= 1; mar_enable <= 1;
			#20 zlo_out <= 0; mar_enable <= 0;  
		end
		ld6: begin
			read <= 1; mdr_enable <= 1;
			#20 read <= 0; mdr_enable <= 0;
		end
		ld7: begin
			mdr_out <= 1; gra <= 1; r_in <= 1;
			#20 mdr_out <= 0; gra <= 0; r_in <= 0;
		end

        // ldi instruction
        ldi3: begin	
			grb <= 1; ba_out <= 1; y_enable <= 1;
			#20 grb <= 0; ba_out <= 0; y_enable <= 0;
		end
		ldi4: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end
		ldi5: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end

        // brmi instruction
        br3: begin	
			gra <= 1; r_out <= 1; con_enable <= 1;
            #20 gra <= 0; r_out <= 0; con_enable <= 0;
		end
        br4: begin
            pc_out <= 1; y_enable <= 1;
            #20 pc_out <= 0; y_enable <= 0;
        end
        br5: begin
            c_sign_extended_out <= 1; z_enable <= 1;
            #20 c_sign_extended_out <= 0; z_enable <= 0;
        end
        br6: begin
            if (con_ff == 1) begin
                zlo_out <= 1; pc_enable <= 1; 
                #20 zlo_out <= 0; pc_enable <= 0; //pc_increment <= 1;
                //#20 pc_increment <= 0;
            end
            else begin
                zlo_out <= 1;
                #20 zlo_out <= 0;
            end
        end

        // nop instruction
        nop3: begin
            #40; // Do nothing
        end

        // add instruction
        add_sub3: begin
            grb <= 1; r_out <= 1; y_enable <= 1;
            #20 grb <= 0; r_out <= 0; y_enable <= 0;
        end
        add_sub4: begin
            grc <= 1; r_out <= 1; z_enable <= 1;
            #20 grc <= 0; r_out <= 0; z_enable <= 0;
        end
        add_sub5: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end

        // addi, andi & ori instruction
        addi_andi_ori3: begin	
			grb <= 1; r_out <= 1; y_enable <= 1;
			#20 grb <= 0; r_out <= 0; y_enable <= 0;
		end
		addi_andi_ori4: begin	
			c_sign_extended_out <= 1;  z_enable <= 1;
			#20 c_sign_extended_out <= 0; z_enable <= 0;
		end
		addi_andi_ori5: begin
			zlo_out <= 1; gra <= 1; r_in <= 1;
			#20 zlo_out <= 0; gra <= 0;  r_in <= 0;
		end

        // neg & not instruction
        neg_not3: begin
            grb <= 1; r_out <= 1; z_enable <= 1;
            #20 grb <= 0; r_out <= 0; z_enable <= 0;
        end
        neg_not4: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end

        // ror & rol instruction
        ror_rol3: begin
            grb <= 1; r_out <= 1; y_enable <= 1;
            #20 grb <= 0; r_out <= 0; y_enable <= 0;
        end
        ror_rol4: begin
            grc <= 1; r_out <= 1; z_enable <= 1;
            #20 grc <= 0; r_out <= 0; z_enable <= 0;
        end
        ror_rol5: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end

        // shra, shr & shl instruction
        sh3: begin
            grb <= 1; r_out <= 1; y_enable <= 1;
            #20 grb <= 0; r_out <= 0; y_enable <= 0;
        end
        sh4: begin
            grc <= 1; r_out <= 1; z_enable <= 1;
            #20 grc <= 0; r_out <= 0; z_enable <= 0;
        end
        sh5: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end

        // st instruction
        st3: begin
            gra <= 1; ba_out <= 1; y_enable <= 1;
			#20 gra <= 0; ba_out <= 0; y_enable <= 0;
        end

        // present_state: 11
        st4: begin
            c_sign_extended_out <= 1;  z_enable <= 1;   // ADD c_sign_extended_out (gra) + grb
			#20 c_sign_extended_out <= 0; z_enable <= 0;
        end

        // present_state: 12
        st5: begin
			zlo_out <= 1; mar_enable <= 1;
			#20 zlo_out <= 0; mar_enable <= 0;
		end

        // present_state: 13
        st6: begin
            grb <= 1; r_out <= 1; mdr_enable <= 1;
            #20 grb <= 0; r_out <= 0; mdr_enable <= 0;
        end

        // present_state: 14
        st7: begin
            ram_write <= 1;
            #20 ram_write <= 0;
        end

        and_or3: begin
            grb <= 1; r_out <= 1; y_enable <= 1;
            #20 grb <= 0; r_out <= 0; y_enable <= 0;
        end
        and_or4: begin
            grc <= 1; r_out <= 1; z_enable <= 1;
            #20 grc <= 0; r_out <= 0; z_enable <= 0;
        end
        and_or5: begin
            zlo_out <= 1; gra <= 1; r_in <= 1;
            #20 zlo_out <= 0; gra <= 0; r_in <= 0;
        end

        // mul instruction
        mul3: begin
            gra <= 1; r_out <= 1; y_enable <= 1;
            #20 gra <= 0; r_out <= 0; y_enable <= 0;
        end
        mul4: begin
            grb <= 1; r_out <= 1; z_enable <= 1;
            #20 grb <= 0; r_out <= 0; z_enable <= 0;
        end
        mul5: begin
            zlo_out <= 1; lo_enable <= 1;
            #20 zlo_out <= 0; lo_enable <= 0;
        end
        mul6: begin
            zhi_out <= 1; hi_enable <= 1;
            #20 zhi_out <= 0; hi_enable <= 0;
        end
        // div instruction
        div3: begin
            gra <= 1; r_out <= 1; y_enable <= 1;
            #20 gra <= 0; r_out <= 0; y_enable <= 0;
        end
        div4: begin
            grb <= 1; r_out <= 1; z_enable <= 1;
            #20 grb <= 0; r_out <= 0; z_enable <= 0;
        end
        div5: begin
            zlo_out <= 1; lo_enable <= 1;
            #20 zlo_out <= 0; lo_enable <= 0;
        end
        div6: begin
            zhi_out <= 1; hi_enable <= 1;
            #20 zhi_out <= 0; hi_enable <= 0;
        end
        // mfhi instruction
        mfhi3: begin	
			hi_out <= 1; gra <= 1; r_in <= 1;
            #20 hi_out <= 0; gra <= 0; r_in <= 0;
		end
        // mflo instruction
        mflo3: begin	
			lo_out <= 1; gra <= 1; r_in <= 1;
            #20 lo_out <= 0; gra <= 0; r_in <= 0;
		end
        // jal instruction
        jal3: begin	
			pc_out <= 1; r15_enable <= 1;
            #20 pc_out <= 0; r15_enable <= 0;
		end
        jal4: begin
            pc_enable <= 1; gra <= 1; r_out <= 1;
			#20 pc_enable <= 0; gra <= 0; r_out <= 0;
        end
        // jr instruction
        jr3: begin
            gra <= 1; r_out <= 1; pc_enable <= 1;
			#20 gra <= 0; r_out <= 0; pc_enable <= 0;
        end
        // in instruction
        in3: begin	
			inport_out <= 1; gra <= 1; r_in <= 1;
            #20 inport_out <= 0; gra <= 0; r_in <= 0;
		end
        // out instruction
        out3: begin
            outport_enable <= 1; gra <= 1; r_out <= 1;
            #20 outport_enable <= 0; gra <= 0; r_out <= 0;
        end
        // TODO: FILL IN JOBS
    endcase
end
endmodule