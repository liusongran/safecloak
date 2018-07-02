#ifdef  CALL_H
#define CALL_H

typedef unsigned int	uint32_t;

#define callPRIMARY_CORE    (uint32_t(0))
#define callSECONDARY_CORE  (uint32_t(1))

#define TRUE 1
#define FALSE 0

/** smc call function */
uint32_t uCallSafeCloak (uint32_t uPeripheralIndex, uint32_t uCoreIndex);


#endif