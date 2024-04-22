-- Library Clause(s) (optional)
-- Use Clause(s) (optional)
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.filter_shared_package.all;

entity filter_mac_datapath is
    generic
        (
            -- Multiplier and Adder Pipeline Lengths
            FPMULT_PIPE_LENGTH  : P_T := PM;
            FPADD_PIPE_LENGTH   : P_T := PA;
            PRECISION           : natural := PREC
            );

    port
        (
            -- Input ports
            clk, rst : in std_logic;
            X        : in DATA_IO_PORT_T;
            Y        : in DATA_IO_PORT_T;
            A        : in DATA_IO_PORT_T;

            -- Output ports
            R : out DATA_IO_PORT_T
            );
end filter_mac_datapath;

architecture filter_mac_datapath_arch of filter_mac_datapath is
    signal tmp_r_s, mult2add_reg_s : DATA_IO_PORT_T;
begin
    MAC_FPMULT_6: if FPMULT_PIPE_LENGTH = 6 generate
            FPMULT_DBL:if PRECISION=DOUBLE_EXT generate
                DOUBLE : entity work.double_fpmult_d6
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);                
            end generate;
            
            FPMULT_SGL:if PRECISION=SINGLE_EXT generate
                SINGLE : entity work.single_fpmult_d6
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);
            end generate;
	end generate;

    MAC_FPMULT_7: if FPMULT_PIPE_LENGTH = 7 generate
            FPMULT_DBL:if PRECISION=DOUBLE_EXT generate
                DOUBLE : entity work.double_fpmult_d7
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);                
            end generate;
            
            FPMULT_SGL:if PRECISION=SINGLE_EXT generate
                SINGLE : entity work.single_fpmult_d7
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);
            end generate;
	end generate;
    
    MAC_FPMULT_8: if FPMULT_PIPE_LENGTH = 8 generate
            FPMULT_DBL:if PRECISION=DOUBLE_EXT generate
                DOUBLE : entity work.double_fpmult_d8
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);                
            end generate;
            
            FPMULT_SGL:if PRECISION=SINGLE_EXT generate
                SINGLE : entity work.single_fpmult_d8
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);
            end generate;
	end generate;

    MAC_FPMULT_9: if FPMULT_PIPE_LENGTH = 9 generate
            FPMULT_DBL:if PRECISION=DOUBLE_EXT generate
                DOUBLE : entity work.double_fpmult_d9
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);                
            end generate;
            
            FPMULT_SGL:if PRECISION=SINGLE_EXT generate
                SINGLE : entity work.single_fpmult_d9
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);
            end generate;
	end generate;
    
    MAC_FPMULT_10: if FPMULT_PIPE_LENGTH = 10 generate
            FPMULT_DBL:if PRECISION=DOUBLE_EXT generate
                DOUBLE : entity work.double_fpmult_d10
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);                
            end generate;
            
            FPMULT_SGL:if PRECISION=SINGLE_EXT generate
                SINGLE : entity work.single_fpmult_d10
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);
            end generate;
	end generate;    
    
    MAC_FPMULT_11: if FPMULT_PIPE_LENGTH = 11 generate
            FPMULT_DBL:if PRECISION=DOUBLE_EXT generate
                DOUBLE : entity work.double_fpmult_d11
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);                
            end generate;
            
            FPMULT_SGL:if PRECISION=SINGLE_EXT generate
                SINGLE : entity work.single_fpmult_d11
                    port map (clk => clk, rst => rst, X => X, Y => Y, R => tmp_r_s);
            end generate;
	end generate;    
    
    -- Register between FP Multiplier and FP Adder
    FPMULT2FPADD_MEM : process(clk, rst) is
        -- Declaration(s) 
    begin
        if(rst = '0') then
            -- Asynchronous Sequential Statement(s) 
            mult2add_reg_s <= (others => '0');
        elsif(rising_edge(clk)) then
            -- Synchronous Sequential Statement(s)
            mult2add_reg_s <= tmp_r_s;
        end if;
    end process FPMULT2FPADD_MEM;
    
    MAC_FPADD_6: if FPADD_PIPE_LENGTH = 6 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d6
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d6
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;    

    MAC_FPADD_7: if FPADD_PIPE_LENGTH = 7 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d7
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d7
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;
    
    MAC_FPADD_8: if FPADD_PIPE_LENGTH = 8 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d8
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d8
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;    
    
    MAC_FPADD_9: if FPADD_PIPE_LENGTH = 9 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d9
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d9
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;    

    MAC_FPADD_10: if FPADD_PIPE_LENGTH = 10 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d10
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d10
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;
    
    MAC_FPADD_11: if FPADD_PIPE_LENGTH = 11 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d11
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d11
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;    

    MAC_FPADD_12: if FPADD_PIPE_LENGTH = 12 generate
            FPADD_DBL:if PRECISION=DOUBLE_EXT generate
                    DOUBLE: entity work.double_fpadder_d12
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate; 

            FPADD_SGL:if PRECISION=SINGLE_EXT generate
                    SINGLE: entity work.single_fpadder_d12
                        port map (clk => clk, rst => rst, X => mult2add_reg_s, Y => A, R => R);
            end generate;                
	end generate;
    
end filter_mac_datapath_arch;