# Job
Add the following job to your: qb-core/shared/jobs.lua

['motorwaymaintence'] = {
    label = 'motorway maintence',
    defaultDuty = true,
    offDutyPay = false,
    grades = {
        ['0'] = {
            name = 'road worker',
            payment = 50
        },
    },
},


