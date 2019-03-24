LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_reg_desp IS
END test_reg_desp;
 
ARCHITECTURE behavior OF test_reg_desp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_desp
    PORT(
         SIN : IN  std_logic;
         CLK : IN  std_logic;
			EN : IN std_logic;
         Q : OUT  std_logic_vector(13 downto 0)
        );
    END COMPONENT;
   

   --Inputs
   signal SIN : std_logic := '0';
   signal CLK : std_logic := '0';
	signal EN : std_logic := '0';
 	--Outputs
   signal Q : std_logic_vector(13 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_desp PORT MAP (
          SIN => SIN,
          CLK => CLK,
			 EN => EN,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- Periodo de reloj de 10 ns
      wait for 10 ns;	
		
		-- Vamos introduciendo a través de la línea de entrada serie
		-- 8 '0' y 32 '1' de forma sícrona con el reloj
		EN<='1';
      SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
		EN<='0';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
		EN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='0';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
		SIN<='1';
      wait for CLK_period;
      wait;
		
   end process;
END;
