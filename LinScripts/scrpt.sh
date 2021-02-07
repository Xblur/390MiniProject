first="true"
if(($# == 1 && $# == "k")) ; then
if(($first == "true")) ; then
	grep -e Dirty: /proc/meminfo
	grep -e Dirty: /proc/meminfo | awk '{$mem = $2/1024; printf("%d MB\n", $mem)}'
	first="false"
fi

if(($first == "false")) ; then
	prev= $1
	grep -e Dirty: /proc/meminfo
       	grep -e Dirty: /proc/meminfo | awk '{$mem = $2/1024; $dif = $prev - $mem; printf("%d MB difference\n", $dif)}'
fi
fi
if(($# == 1 && $# != "k")) ; then
	echo incorrect arg
fi
if(($# > 1)) ; then
	echo incorrect number of args
fi
if(($# == 0)) ; then
	if(($first == "true")) ; then
		grep -e Dirty: /proc/meminfo | awk '{$mem = $2/1024; printf("%d MB\n", $mem)}'
		first="false"
	fi
	if(($first == "false")) ; then
		prev= $1
		grep -e Dirty: /proc/meminfo | awk '{$mem = $2/1024; $dif = $prev - $mem; printf("%d MB difference\n", $dif)}'
	fi
fi
