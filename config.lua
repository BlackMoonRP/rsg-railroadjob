Config = {}

Config.printdebug = function(message)
    print(message)    
end

Config.debug = false

Config.jobs = {
    'railroad',
    'lawmen' -- just for testing
}

Config.Train = -593637311

Config.CentralTrains = {
    [1] = {
        hash = -1464742217,
        label = 'Central union Railroad'
    },
    [2] = {
        hash = -577630801,
        label = 'Central union Railroad'
    },
    [3] = {
        hash = -1901305252,
        label = 'Central union Railroad'
    },
    [4] = {
        hash = 1495948496,
        label = 'Central union Railroad'
    },
    [5] = {
        hash = 1365127661,
        label = 'Central union Railroad'
    },
    [6] = {
        hash = 1285344034,
        label = 'Central union Railroad'
    },
    [7] = {
        hash = -156591884,
        label = 'Central union Railroad'
    },
    [8] = {
        hash = -1740474560,
        label = 'Central union Railroad'
    },
    [9] = {
        hash = -651487570,
        label = 'Central union Railroad'
    },
    [10] = {
        hash = 1094934838,
        label = 'Central union Railroad'
    },
}

Config.SouthernTrains = {
    [1] = {
        hash = -1719006020,
        label = 'Southern and Eastern Railway'
    },
    [2] = {
        hash = 1030903581,
        label = 'Southern and Eastern Railway'
    },
    [3] = {
        hash = -2006657222,
        label = 'Southern and Eastern Railway'
    },
    [4] = {
        hash = 987516329,
        label = 'Southern and Eastern Railway'
    },
    [5] = {
        hash = -593637311,
        label = 'Southern and Eastern Railway'
    },
    [6] = {
        hash = 1216031719,
        label = 'Southern and Eastern Railway'
    }
}


Config.OtherTrains = {
    [1] = {
        hash = 519580241,
        label = 'Lannahechee and Midland Rail Co.'
    },
    [2] = {
        hash = -1083616881,
        label = 'Cornwall City Railway (Trolly)'
    },
    [3] = {
        hash = 1054492269,
        label = 'Mining Cart'
    },
}

Config.stops = {{
    dst = 180.0,
    dst2 = 4.0,
    coords = vector3(-142.67, 654.18, 113.52),
    time = 60000,
    name = "Valentine Station"
}, {
    dst = 400.0,
    dst2 = 4.0,
    coords = vector3(2685.39, -1480.33, 45.80),
    time = 60000,
    name = "Saint Denis Station"
}, {
    dst = 220.0,
    dst2 = 4.0,
    coords = vector3(1197.48, -1282.29, 76.45),
    time = 60000,
    name = "Rhodes Station"
}, {
    dst = 220.0,
    dst2 = 4.0,
    coords = vector3(-379.38, -369.51, 86.44),
    time = 30000,
    name = "Flatneck Station"
}, {
    dst = 180.0,
    dst2 = 4.0,
    coords = vector3(-1118.27, -567.17, 82.67),
    time = 30000,
    name = "Riggs Station"
}, {
    dst = 180.0,
    dst2 = 4.0,
    coords = vector3(-1291.04, 440.69, 94.36),
    time = 30000,
    name = "Wallace Station"
}, {
    dst = 180.0,
    dst2 = 4.0,
    coords = vector3(610.54, 1661.53, 188.0),
    time = 30000,
    name = "Bacchus Station"
}, {
    dst = 220.0,
    dst2 = 4.0,
    coords = vector3(2914.50, 1238.53, 44.73),
    time = 60000,
    name = "Annesburg Station"
}, {
    dst = 180.0,
    dst2 = 4.0,
    coords = vector3(2879.30, 592.75, 57.84),
    time = 60000,
    name = "Van Horn Tradin Post"
}}