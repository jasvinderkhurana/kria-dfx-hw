set XSA "opendfx_shell_wrapper"
set PATH "./bitFiles/"
set SRC "./FFT"
set SRCM "./src"
set WS "workspace"
set SYSCFG "app_sysconfig"
set DOMAIN "app_domain"
set APP "FFT"
setws ${WS}
if [file exists ${WS}/${XSA}_platform_0] {
	puts "Platform exists."
	puts "Activating Platform ...."
	platform active ${XSA}_platform_0
} else {
	puts "Creating Platform ....."
	platform create -name ${XSA}_platform_0 -hw ${PATH}/${XSA}.xsa
}
platform report
domain list
if {![file exists ${WS}/${XSA}_platform_0/psu_cortexa53_0/${DOMAIN}]} {
	puts "Creating Domain ....."
	domain create -name ${DOMAIN} -os standalone -proc psu_cortexa53_0
	platform generate
} else {
	puts "Domain exists."
	domain active ${DOMAIN}
}
repo -libs

if {![file exists ${WS}/${APP}]} {
	puts "Creating APP ....."
	app create -name ${APP} -domain ${DOMAIN} -template "Empty Application(C)"
	importsources -name ${APP} -linker-script -path ${SRC}
	importsources -name ${APP} -linker-script -path ${SRCM}
} else {
	puts "APP exists."

}
app build ${APP} 


