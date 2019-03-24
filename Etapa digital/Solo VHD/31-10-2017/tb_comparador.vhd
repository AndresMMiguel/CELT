--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:20:47 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/alumno/Desktop/Dig33/digital33/tb_comparador.vhd
-- Project Name:  Digital33
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_comparador IS
END tb_comparador;
 
ARCHITECTURE behavior OF tb_comparador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparador
    PORT(
         P : IN  std_logic_vector(5 downto 0);
         Q : IN  std_logic_vector(5 downto 0);
         PGTQ : OUT  std_logic;
         PLEQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal P : std_logic_vector(5 downto 0) := (others => '0');
   signal Q : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal PGTQ : std_logic;
   signal PLEQ : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparador PORT MAP (
          P => P,
          Q => Q,
          PGTQ => PGTQ,
          PLEQ => PLEQ
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		P<="011111";
		Q<="100110";
      wait for 100 ns;
		P<="010000";
		Q<="000000";
		wait for 100 ns;
		P<="000100";
		Q<="000100";


      -- insert stimulus here 

      wait;
   end process;

END;
