

/** Standard includes */
#include <stdint.h>
#include <stdio.h>

/** SafeCloak includes */
#include "include/call.h"


uint32_t uCallSafeCloak (uint32_t uPeripheralIndex, uint32_t uCoreIndex)
{
    uint32_t uRet;
    uint32_t uWorldType = 1; //non-secure world

    if(uCoreIndex == callPRIMARY_CORE)
    {
        __asm__ __volatile__ (
            "mov r0, %[uPIndex]\n"
            "mov r1, %[uWType]\n"
            "smc #0\n"
            :
            :[uPIndex]"r" (uPeripheralIndex), [uWType]"r" (uWorldType)
            :"memory", "cc"
        );
        uRet = TRUE;
        printf("Succeed to preempte peripheral%d. We are back to normal world now!\n", uPeripheralIndex);      
    }
    else {
        uRet = FALSE;
        printf("Failed to preempte peripheral%d!!!\n", uPeripheralIndex);         
    }

    return uRet;	
}

