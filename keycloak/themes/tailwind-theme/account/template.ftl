<#macro mainLayout active bodyClass>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>${msg("accountManagementTitle")} - ${realm.displayName!}</title>
    
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    
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
        .bg-primary-500 { background-color: var(--primary-500); }
        .bg-primary-600 { background-color: var(--primary-600); }
        .bg-primary-700 { background-color: var(--primary-700); }
        
        .text-primary-500 { color: var(--primary-500); }
        .text-primary-600 { color: var(--primary-600); }
        .text-primary-700 { color: var(--primary-700); }
        
        .border-primary-200 { border-color: var(--primary-200); }
        .border-primary-500 { border-color: var(--primary-500); }
        .border-primary-600 { border-color: var(--primary-600); }
        
        .ring-primary-500 { --tw-ring-color: var(--primary-500); }
        
        .hover\:bg-primary-50:hover { background-color: var(--primary-50); }
        .hover\:bg-primary-700:hover { background-color: var(--primary-700); }
        .hover\:text-primary-600:hover { color: var(--primary-600); }
        .hover\:border-primary-600:hover { border-color: var(--primary-600); }
        
        .focus\:ring-primary-500:focus { --tw-ring-color: var(--primary-500); }
        .focus\:border-primary-500:focus { border-color: var(--primary-500); }
    </style>
</head>

<body class="bg-gray-50">
    <div class="min-h-screen">
        <!-- Header -->
        <header class="bg-white shadow-sm">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <img src="${url.resourcesPath}/${properties.logoPath!'img/logo.png'}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                        <span class="ml-3 text-xl font-semibold text-gray-900">${realm.displayName!}</span>
                    </div>
                    <div class="flex items-center space-x-4">
                        <span class="text-sm text-gray-700">${account.username!}</span>
                        <a href="${url.logoutUrl}" class="inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500">
                            ${msg("doSignOut")}
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <div class="lg:grid lg:grid-cols-12 lg:gap-x-8">
                <!-- Sidebar Navigation -->
                <aside class="py-6 lg:col-span-3">
                    <nav class="space-y-1">
                        <a href="${url.accountUrl}" class="<#if active=='account'>bg-primary-50 border-primary-600 text-primary-700<#else>border-transparent text-gray-600 hover:bg-gray-50 hover:text-gray-900</#if> group border-l-4 px-3 py-2 flex items-center text-sm font-medium">
                            <svg class="<#if active=='account'>text-primary-600<#else>text-gray-400 group-hover:text-gray-500</#if> flex-shrink-0 -ml-1 mr-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                            </svg>
                            <span>${msg("personalInfo")}</span>
                        </a>

                        <a href="${url.passwordUrl}" class="<#if active=='password'>bg-primary-50 border-primary-600 text-primary-700<#else>border-transparent text-gray-600 hover:bg-gray-50 hover:text-gray-900</#if> group border-l-4 px-3 py-2 flex items-center text-sm font-medium">
                            <svg class="<#if active=='password'>text-primary-600<#else>text-gray-400 group-hover:text-gray-500</#if> flex-shrink-0 -ml-1 mr-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
                            </svg>
                            <span>${msg("accountSecurity")}</span>
                        </a>

                        <#if features.identityFederation>
                        <a href="${url.socialUrl}" class="<#if active=='social'>bg-primary-50 border-primary-600 text-primary-700<#else>border-transparent text-gray-600 hover:bg-gray-50 hover:text-gray-900</#if> group border-l-4 px-3 py-2 flex items-center text-sm font-medium">
                            <svg class="<#if active=='social'>text-primary-600<#else>text-gray-400 group-hover:text-gray-500</#if> flex-shrink-0 -ml-1 mr-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"/>
                            </svg>
                            <span>${msg("linkedAccounts")}</span>
                        </a>
                        </#if>

                        <a href="${url.sessionsUrl}" class="<#if active=='sessions'>bg-primary-50 border-primary-600 text-primary-700<#else>border-transparent text-gray-600 hover:bg-gray-50 hover:text-gray-900</#if> group border-l-4 px-3 py-2 flex items-center text-sm font-medium">
                            <svg class="<#if active=='sessions'>text-primary-600<#else>text-gray-400 group-hover:text-gray-500</#if> flex-shrink-0 -ml-1 mr-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                            </svg>
                            <span>${msg("deviceActivity")}</span>
                        </a>

                        <#if features.authorization>
                        <a href="${url.applicationsUrl}" class="<#if active=='applications'>bg-primary-50 border-primary-600 text-primary-700<#else>border-transparent text-gray-600 hover:bg-gray-50 hover:text-gray-900</#if> group border-l-4 px-3 py-2 flex items-center text-sm font-medium">
                            <svg class="<#if active=='applications'>text-primary-600<#else>text-gray-400 group-hover:text-gray-500</#if> flex-shrink-0 -ml-1 mr-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/>
                            </svg>
                            <span>${msg("applications")}</span>
                        </a>
                        </#if>
                    </nav>
                </aside>

                <!-- Main content -->
                <main class="lg:col-span-9">
                    <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="mb-6 rounded-md p-4 <#if message.type = 'success'>bg-green-50 border border-green-200<#elseif message.type = 'warning'>bg-yellow-50 border border-yellow-200<#elseif message.type = 'error'>bg-red-50 border border-red-200<#else>bg-blue-50 border border-blue-200</#if>">
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
                                    <#else>
                                        <svg class="h-5 w-5 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                                        </svg>
                                    </#if>
                                </div>
                                <div class="ml-3">
                                    <p class="text-sm font-medium <#if message.type = 'success'>text-green-800<#elseif message.type = 'warning'>text-yellow-800<#elseif message.type = 'error'>text-red-800<#else>text-blue-800</#if>">
                                        ${kcSanitize(message.summary)?no_esc}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </#if>

                    <#nested "content">
                </main>
            </div>
        </div>
    </div>
</body>
</html>
</#macro>
