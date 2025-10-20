<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="text-center">
            <h1 class="text-3xl font-bold text-red-600 mb-2">${msg("errorTitle")}</h1>
            <p class="text-gray-600">${msg("errorMessage")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-error-message" class="text-center">
            <div class="bg-red-50 border border-red-200 text-red-800 rounded-md p-4 mb-6">
                <div class="flex">
                    <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <div class="ml-3">
                        <h3 class="text-sm font-medium text-red-800">
                            ${message.summary}
                        </h3>
                        <#if message.detail??>
                            <div class="mt-2 text-sm text-red-700">
                                <p>${message.detail}</p>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>

            <#if client?? && client.baseUrl?has_content>
                <p class="mt-6">
                    <a href="${client.baseUrl}" class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out">
                        ${kcSanitize(msg("backToApplication"))?no_esc}
                    </a>
                </p>
            <#else>
                <p class="mt-6">
                    <a href="javascript:history.back()" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out">
                        ${msg("doBack")}
                    </a>
                </p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
