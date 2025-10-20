<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="text-center">
            <h1 class="text-3xl font-bold text-blue-600 mb-2">${msg("infoTitle")}</h1>
        </div>
    <#elseif section = "form">
        <div id="kc-info-message" class="text-center">
            <div class="bg-blue-50 border border-blue-200 text-blue-800 rounded-md p-4 mb-6">
                <div class="flex">
                    <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <div class="ml-3 text-left">
                        <p class="text-sm font-medium text-blue-800">
                            ${message.summary}
                        </p>
                        <#if requiredActions??>
                            <div class="mt-2">
                                <#list requiredActions as reqActionItem>
                                    <p class="text-sm text-blue-700">${msg("requiredAction.${reqActionItem}")}</p>
                                </#list>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>

            <#if skipLink??>
                <!-- Skip link provided -->
            <#elseif pageRedirectUri?has_content>
                <p class="mt-6">
                    <a href="${pageRedirectUri}" class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out">
                        ${kcSanitize(msg("backToApplication"))?no_esc}
                    </a>
                </p>
            <#elseif actionUri?has_content>
                <p class="mt-6">
                    <a href="${actionUri}" class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition duration-150 ease-in-out">
                        ${kcSanitize(msg("proceedWithAction"))?no_esc}
                    </a>
                </p>
            <#elseif (client.baseUrl)?has_content>
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
