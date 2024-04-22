LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE pr_types IS
	type integer_vector is array( NATURAL range <> ) of integer;
END PACKAGE pr_types;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.pr_types.all;
USE work.float_types.all;
USE work.ann_types.all;

PACKAGE pr_components IS
	COMPONENT pr IS
		GENERIC (
			N_I : INTEGER := 16;	-- pattern input size
			N_O : INTEGER := 16;	-- number of classes to recognize
			N_T : INTEGER := 16		-- number of traning data
		);
		PORT (
			reset, clock, go : IN STD_LOGIC;
			training_data : IN STD_LOGIC_VECTOR(N_T * N_I - 1 downto 0);
			training_class : IN INTEGER_VECTOR(N_T - 1 downto 0);
			training_mse : IN FLOAT;
			inputs : IN STD_LOGIC_VECTOR(N_I - 1 downto 0);
			output : OUT INTEGER;
			ready : OUT STD_LOGIC;

			ann_mode : INOUT ann_mode;
			ann_alpha : OUT float;
			ann_inputs : OUT float_vector(N_I - 1 downto 0);
			ann_targets : OUT float_vector(N_O - 1 downto 0);
			ann_outputs : IN float_vector(N_O - 1 downto 0);
			ann_mse : IN float;
			ann_ready : IN STD_LOGIC;
			
			lfsr_output : IN STD_LOGIC_VECTOR(15 downto 0)
		);
	END COMPONENT pr;
END PACKAGE pr_components;



LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
USE work.pr_types.all;
USE work.float_types.all;
USE work.float_constants.all;
USE work.float_components.all;
USE work.ann_types.all;

ENTITY pr IS
	GENERIC (
		N_I : INTEGER := 16;	-- pattern input size
		N_O : INTEGER := 16;	-- number of classes to recognize
		N_T : INTEGER := 16		-- number of traning data
	);
	PORT (
		reset, clock, go : IN STD_LOGIC;
		training_data : IN STD_LOGIC_VECTOR(N_T * N_I - 1 downto 0);
		training_class : IN INTEGER_VECTOR(N_T - 1 downto 0);
		training_mse : IN FLOAT;
		inputs : IN STD_LOGIC_VECTOR(N_I - 1 downto 0);
		output : OUT INTEGER;
		ready : OUT STD_LOGIC;

		ann_mode : INOUT ann_mode;
		ann_alpha : OUT float;
		ann_inputs : OUT float_vector(N_I - 1 downto 0);
		ann_targets : OUT float_vector(N_O - 1 downto 0);
		ann_outputs : IN float_vector(N_O - 1 downto 0);
		ann_mse : IN float;
		ann_ready : IN STD_LOGIC;

		lfsr_output : IN STD_LOGIC_VECTOR(15 downto 0)
	);
END ENTITY pr;

ARCHITECTURE pr OF pr IS
	constant alpha : float := float_half;

	subtype classes is integer range 0 to N_O - 1;
	signal class, k : classes := 0;
	
	type states is (init, train, train_validate, train_validate_wait, train_validate_complete, run, run_complete, run_validate, run_validate_wait, run_validate_complete, idle);
	signal state : states := init;
	
	signal fp_cmp_enable, fp_cmp_agb : std_logic := '0';
	signal fp_cmp_a, fp_cmp_b : float := float_zero;
	
	signal train_success_count, j : integer := 0;
BEGIN

ann_alpha <= alpha;
output <= class;

fp_cmp0 : fp_cmp port map (reset, fp_cmp_enable, clock, fp_cmp_a, fp_cmp_b, fp_cmp_agb);

fsm : PROCESS(clock, reset) IS
BEGIN
	IF (reset = '1') THEN
		ready <= '0';
		state <= init;
	ELSIF (clock = '1' AND clock'event) THEN
		IF (ann_mode /= idle) THEN
			ann_mode <= idle;
		ELSIF (ann_ready = '0') THEN
		ELSE
			CASE state IS
			WHEN init =>
				ready <= '0';
				state <= train;
				train_success_count <= 0;
				j <= 0;
			WHEN train =>
				FOR I IN N_I - 1 downto 0 LOOP
					IF training_data(j * N_I + I) = '1' THEN
						ann_inputs(I) <= float_one;
					ELSE
						ann_inputs(I) <= float_zero;
					END IF;
				END LOOP;
				ann_targets <= (others => float_zero);
				ann_targets(training_class(j)) <= float_one;
				ann_mode <= learn;
				state <= train_validate;
			WHEN train_validate =>
				fp_cmp_a <= training_mse;
				fp_cmp_b <= ann_mse;
				fp_cmp_enable <= '1';
				state <= train_validate_wait;
			WHEN train_validate_wait =>
				state <= train_validate_complete;
			WHEN train_validate_complete =>
				IF (j = N_T - 1) THEN
					j <= 0;
				ELSE
					j <= j + 1;
				END IF;
				fp_cmp_enable <= '0';
				IF (fp_cmp_agb = '0') THEN
					state <= train;
					train_success_count <= 0;
				ELSE
					train_success_count <= train_success_count + 1;
					IF (train_success_count /= N_T) THEN
						state <= train;
					ELSE
						ready <= '1';
						state <= run;
					END IF;				
				END IF;


			WHEN run =>
				FOR I IN N_I - 1 downto 0 LOOP
					IF inputs(I) = '1' THEN
						ann_inputs(I) <= float_one;
					ELSE
						ann_inputs(I) <= float_zero;
					END IF;
				END LOOP;
				ann_mode <= run;
				state <= run_complete;
			WHEN run_complete =>
				class <= 0;
				k <= 0;
				fp_cmp_enable <= '1';
				state <= run_validate;
			WHEN run_validate =>
				fp_cmp_a <= ann_outputs(k);
				fp_cmp_b <= ann_outputs(class);
				state <= run_validate_wait; 
			WHEN run_validate_wait =>
				state <= run_validate_complete;
			WHEN run_validate_complete =>
				IF (fp_cmp_agb = '1') THEN
					class <= k;
				END IF;
				IF (k = N_O - 1) THEN
					fp_cmp_enable <= '0';
					state <= idle;
				ELSE
					k <= k + 1;
					state <= run_validate;
				END IF;


			WHEN idle =>
				IF (go = '1') THEN
					state <= run;
				ELSE
					state <= idle;
				END IF;
			WHEN others =>
				state <= init;
			END CASE;
		END IF;
	END IF;
END PROCESS;

END ARCHITECTURE pr;

