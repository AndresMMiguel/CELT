--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:36:32 10/24/2017
-- Design Name:   
-- Module Name:   C:/Users/alumno/Desktop/Dig33/digital33/tb_AND2.vhd
-- Project Name:  Digital33
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AND2
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
 
ENTITY tb_AND2 IS
END tb_AND2;
 
ARCHITECTURE behavior OF tb_AND2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AND2
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal S : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AND2 PORT MAP (
          A => A,
          B => B,
          S => S
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A<='0';
		B<='0';
		wait for 100 ns;	
		A<='0';
		B<='1';
		wait for 100 ns;	
		A<='1';
		B<='0';
		wait for 100 ns;	
		A<='1';
		B<='1';


      -- insert stimulus here 

      wait;
   end process;

END;
