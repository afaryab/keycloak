<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <div class="mb-8">
            <!-- Brand Logo -->
            <div class="flex items-center mb-8">
                <#if realm.logo??>
                    <img src="${realm.logo}" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                <#else>
                    <img src="${url.resourcesPath}/img/logo.png" alt="${realm.displayName!} Logo" class="h-8 w-8"/>
                </#if>
                <span class="ml-3 text-lg font-semibold text-gray-900">${realm.displayName!}</span>
            </div>
            <div class="text-left">
                <h1 class="text-2xl font-semibold text-gray-900 mb-2">Verify your email</h1>
                <p class="text-gray-600">We have sent a verification link to your email address.</p>
            </div>
        </div>
    <#elseif section = "form">
        <div id="kc-info-message" class="text-left">
            <p class="text-gray-600 mb-4">
                A verification link has been sent to 
                <span class="font-medium text-emerald-600">
                    <#if user.email?has_content>
                        ${user.email}
                    <#else>
                        your email address
                    </#if>
                </span>.<br>
                Follow the instructions in the email to verify your account.
            </p>
        </div>
    </#if>
</@layout.registrationLayout>