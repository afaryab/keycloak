<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="mb-8">
            <!-- Brand Logo -->
            <div class="flex items-center mb-8">
                <#if realm.logo??>
                    <img src="${realm.logo}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                <#else>
                    <img src="${url.resourcesPath}/${properties.logoPath!'img/logo.png'}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                </#if>
                <span class="ml-3 text-lg font-semibold text-gray-900">${realm.displayName!}</span>
            </div>
            <div class="text-left">
                <h1 class="text-2xl font-semibold text-gray-900 mb-2">${msg("verifyEmailTitle")}</h1>
                <p class="text-gray-600">${msg("verifyEmailWelcome")}</p>
            </div>
        </div>
    <#elseif section = "form">
        <div id="kc-info-message" class="text-left">
            <p class="text-gray-600 mb-4">
                ${msg("verifyEmailMessage")}
            </p>
            <#if user.email?has_content>
                <p class="text-sm text-gray-500 mt-2">
                    Email sent to: <span class="font-medium text-primary-600">${user.email}</span>
                </p>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>