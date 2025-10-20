<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
    
    <style>
        :root {
            <#-- Dynamic color theming based on themeColor property -->
            <#if properties.themeColor?? && properties.themeColor == "blue">
                --primary-50: #eff6ff;
                --primary-100: #dbeafe;
                --primary-200: #bfdbfe;
                --primary-300: #93c5fd;
                --primary-400: #60a5fa;
                --primary-500: #3b82f6;
                --primary-600: #2563eb;
                --primary-700: #1d4ed8;
                --primary-800: #1e40af;
                --primary-900: #1e3a8a;
            <#elseif properties.themeColor?? && properties.themeColor == "green">
                --primary-50: #f0fdf4;
                --primary-100: #dcfce7;
                --primary-200: #bbf7d0;
                --primary-300: #86efac;
                --primary-400: #4ade80;
                --primary-500: #22c55e;
                --primary-600: #16a34a;
                --primary-700: #15803d;
                --primary-800: #166534;
                --primary-900: #14532d;
            <#elseif properties.themeColor?? && properties.themeColor == "purple">
                --primary-50: #faf5ff;
                --primary-100: #f3e8ff;
                --primary-200: #e9d5ff;
                --primary-300: #d8b4fe;
                --primary-400: #c084fc;
                --primary-500: #a855f7;
                --primary-600: #9333ea;
                --primary-700: #7e22ce;
                --primary-800: #6b21a8;
                --primary-900: #581c87;
            <#elseif properties.themeColor?? && properties.themeColor == "red">
                --primary-50: #fef2f2;
                --primary-100: #fee2e2;
                --primary-200: #fecaca;
                --primary-300: #fca5a5;
                --primary-400: #f87171;
                --primary-500: #ef4444;
                --primary-600: #dc2626;
                --primary-700: #b91c1c;
                --primary-800: #991b1b;
                --primary-900: #7f1d1d;
            <#elseif properties.themeColor?? && properties.themeColor == "indigo">
                --primary-50: #eef2ff;
                --primary-100: #e0e7ff;
                --primary-200: #c7d2fe;
                --primary-300: #a5b4fc;
                --primary-400: #818cf8;
                --primary-500: #6366f1;
                --primary-600: #4f46e5;
                --primary-700: #4338ca;
                --primary-800: #3730a3;
                --primary-900: #312e81;
            <#elseif properties.themeColor?? && properties.themeColor == "pink">
                --primary-50: #fdf2f8;
                --primary-100: #fce7f3;
                --primary-200: #fbcfe8;
                --primary-300: #f9a8d4;
                --primary-400: #f472b6;
                --primary-500: #ec4899;
                --primary-600: #db2777;
                --primary-700: #be185d;
                --primary-800: #9d174d;
                --primary-900: #831843;
            <#elseif properties.themeColor?? && properties.themeColor == "yellow">
                --primary-50: #fefce8;
                --primary-100: #fef9c3;
                --primary-200: #fef08a;
                --primary-300: #fde047;
                --primary-400: #facc15;
                --primary-500: #eab308;
                --primary-600: #ca8a04;
                --primary-700: #a16207;
                --primary-800: #854d0e;
                --primary-900: #713f12;
            <#elseif properties.themeColor?? && properties.themeColor == "orange">
                --primary-50: #fff7ed;
                --primary-100: #ffedd5;
                --primary-200: #fed7aa;
                --primary-300: #fdba74;
                --primary-400: #fb923c;
                --primary-500: #f97316;
                --primary-600: #ea580c;
                --primary-700: #c2410c;
                --primary-800: #9a3412;
                --primary-900: #7c2d12;
            <#else>
                <#-- Default to emerald -->
                --primary-50: #ecfdf5;
                --primary-100: #d1fae5;
                --primary-200: #a7f3d0;
                --primary-300: #6ee7b7;
                --primary-400: #34d399;
                --primary-500: #10b981;
                --primary-600: #059669;
                --primary-700: #047857;
                --primary-800: #065f46;
                --primary-900: #064e3b;
            </#if>
        }
        
        body {
            font-family: 'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }
        
        /* Dynamic primary color classes */
        .bg-primary-50 { background-color: var(--primary-50); }
        .bg-primary-100 { background-color: var(--primary-100); }
        .bg-primary-200 { background-color: var(--primary-200); }
        .bg-primary-500 { background-color: var(--primary-500); }
        .bg-primary-600 { background-color: var(--primary-600); }
        .bg-primary-700 { background-color: var(--primary-700); }
        
        .text-primary-500 { color: var(--primary-500); }
        .text-primary-600 { color: var(--primary-600); }
        .text-primary-700 { color: var(--primary-700); }
        
        .border-primary-500 { border-color: var(--primary-500); }
        .border-primary-600 { border-color: var(--primary-600); }
        
        .ring-primary-500 { --tw-ring-color: var(--primary-500); }
        .ring-primary-600 { --tw-ring-color: var(--primary-600); }
        
        .hover\:bg-primary-700:hover { background-color: var(--primary-700); }
        .hover\:text-primary-500:hover { color: var(--primary-500); }
        .hover\:border-primary-500:hover { border-color: var(--primary-500); }
        
        .focus\:ring-primary-500:focus { --tw-ring-color: var(--primary-500); }
        .focus\:border-primary-500:focus { border-color: var(--primary-500); }
        
        /* Debug styles for hero section */
        .hero-debug {
            background: linear-gradient(135deg, var(--primary-500) 0%, var(--primary-600) 100%);
            min-height: 100vh;
            height: 100vh;
            margin: 0 !important;
            padding: 0 !important;
        }
        
        /* Ensure images load properly */
        .hero-bg {
            background-attachment: fixed;
        }
        
        /* Ensure full height layout */
        html, body {
            height: 100vh;
            width: 100vw;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }
        
        /* Force full viewport */
        .full-viewport {
            width: 100vw;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        
        /* Remove any default margins/padding */
        * {
            box-sizing: border-box;
        }
        
        @media (max-width: 1024px) {
            .hero-debug {
                display: none !important;
            }
        }
    </style>
</head>

<body class="m-0 p-0 h-screen w-screen bg-gray-50">
    <div class="min-h-screen h-screen w-full flex flex-col lg:flex-row full-viewport m-0 p-0">
        <!-- Left side - Login Form -->
        <div class="flex-1 lg:flex-1 flex items-center justify-center bg-white m-0">
            <div class="max-w-md w-full space-y-8">
                <div class="bg-white p-8">
                <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                    <header class="text-center mb-8">
                        <#nested "header">
                    </header>
                </#if>

                <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                <#-- during login.                                                                               -->
                <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                    <div class="mb-6">
                        <div class="rounded-md p-4 <#if message.type = 'success'>bg-green-50 border border-green-200<#elseif message.type = 'warning'>bg-yellow-50 border border-yellow-200<#elseif message.type = 'error'>bg-red-50 border border-red-200<#elseif message.type = 'info'>bg-blue-50 border border-blue-200</#if>">
                            <div class="flex">
                                <div class="flex-shrink-0">
                                    <#if message.type = 'success'>
                                        <svg class="h-5 w-5 text-green-400" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                                        </svg>
                                    <#elseif message.type = 'warning'>
                                        <svg class="h-5 w-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                                        </svg>
                                    <#elseif message.type = 'error'>
                                        <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                                        </svg>
                                    <#elseif message.type = 'info'>
                                        <svg class="h-5 w-5 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                        </svg>
                                    </#if>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm <#if message.type = 'success'>text-green-800<#elseif message.type = 'warning'>text-yellow-800<#elseif message.type = 'error'>text-red-800<#elseif message.type = 'info'>text-blue-800</#if>">
                                        ${kcSanitize(message.summary)?no_esc}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>

                <div id="kc-content">
                    <div id="kc-content-wrapper">
                        <#nested "form">

                        <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                            <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                                <div class="mt-6 text-center">
                                    <input type="hidden" name="tryAnotherWay" value="on"/>
                                    <a href="#" id="try-another-way" 
                                       onclick="document.forms['kc-select-try-another-way-form'].submit();return false;"
                                       class="text-sm text-blue-600 hover:text-blue-500 font-medium">
                                        ${msg("doTryAnotherWay")}
                                    </a>
                                </div>
                            </form>
                        </#if>

                        <#nested "socialProviders">

                        <#if displayInfo>
                            <div id="kc-info" class="mt-8">
                                <div id="kc-info-wrapper">
                                    <#nested "info">
                                </div>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Right side - Hero Image with Quote -->
        <div class="hidden lg:flex lg:flex-1 hero-debug m-0 p-0">
            <div class="w-full h-screen bg-gradient-to-br from-emerald-400 to-emerald-600 relative m-0 p-0">
                <!-- Debug: This should show even if image fails -->
                <div class="absolute inset-0 bg-emerald-500"></div>
                <!-- Background Image Layer -->
                <div class="absolute inset-0 bg-cover bg-center bg-no-repeat hero-bg" style="background-image: url('${url.resourcesPath}/img/hero.png'); opacity: 0.8;"></div>
                <!-- Overlay -->
                <div class="absolute inset-0 bg-black bg-opacity-20"></div>
                <!-- Content Layer -->
                <div class="relative h-full flex flex-col justify-between p-12 text-white h-screen z-10">
                    <!-- Top Logo/Brand -->
                    <div class="flex items-center">
                        <#if realm.logo?has_content>
                            <img src="${realm.logo}" alt="${realm.displayName!''} Logo" class="h-8 w-8"/>
                        </#if>
                        <span class="ml-3 text-lg font-semibold">${realm.displayName!''}</span>
                    </div>
                    
                    <!-- Bottom section with quote and navigation -->
                    <div class="flex justify-between items-end">
                        <!-- Main Quote - Left Bottom -->
                        <div class="max-w-lg">
                            <blockquote class="text-3xl font-light leading-relaxed mb-8">
                                "When you're tempted to give up, remember the reasons you began. Every step forward counts, no matter how gradual it may seem."
                            </blockquote>
                        </div>
                        
                        <!-- Navigation arrows - Right Bottom -->
                        <div class="flex space-x-4">
                            <button class="w-10 h-10 rounded-full border border-white/30 flex items-center justify-center hover:bg-white/10 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
                                </svg>
                            </button>
                            <button class="w-10 h-10 rounded-full border border-white/30 flex items-center justify-center hover:bg-white/10 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>
